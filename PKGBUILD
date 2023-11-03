# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-ar
epoch=1
pkgver=23.11.1
pkgrel=1
pkgdesc="Google Noto TTF fonts for Arabic Scripts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters')
_url="https://github.com/notofonts/notofonts.github.io/raw/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoKufiArabic/hinted/ttf/NotoKufiArabic-"{Bold,Regular}.ttf
        "${_url}/NotoNaskhArabic/hinted/ttf/NotoNaskhArabic-"{Bold,Regular}.ttf
        #"${_url}/NotoNaskhArabicUI/hinted/ttf/NotoNaskhArabicUI-"{Bold,Regular}.ttf
        "${_url}/NotoSansArabic/hinted/ttf/NotoSansArabic-"{Bold,Regular}.ttf
        #"${_url}/NotoSansArabicUI/hinted/ttf/NotoSansArabicUI-"{Bold,Regular}.ttf
        "${_url}/LICENSE"
        70-noto-ar.conf)
sha256sums=('74122098a0aca46452605e62fe60d56537906fbe7c5af3fc42b982b5c91a906e'
            '36b64d6449df10d9d7b4327d570f790bdf676be08601574eb127f0bf0d71d0f9'
            '8642fa73c2ae332927d541dbffb83e9ecd85f3ff25d47ded68740c62f666b381'
            'd1edc2394ffcb3ae489aa9f4a8e2bdb22781b3bf5b0b25dcce0aaf2bf44dff93'
            '8abfb620372d3c786eb263d48084869721063f644e0a8c9e5f38b34f4c6923e2'
            'a709dd9b5511fb91687fb23c39897ad52106f43e84fabb19fb482840a2e3547b'
            'f2095b08bed08b23a6fe26112fcd679a2bee3f002eef077eb05d215ed1051bd8'
            'e9eac74b4b261bea372d464e8a04ab225aa2faba0ba1f9e85ab63bf1222e8b8b')

package() {
  install -Dm644 "$srcdir"/Noto*.ttf -t "$pkgdir"/usr/share/fonts/"$pkgname"
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install fontconfig file (sets Noto Sans Arabic UI as default for ar_AR locale)
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
