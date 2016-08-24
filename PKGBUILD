# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
#   (based on texlive-crimson package)

pkgname=texlive-luximono
pkgver=2004_01_26
pkgrel=1
pkgdesc="TeX Live support for the Luxi Mono family of fonts"
arch=('any')
license=('custom')
url="http://www.ctan.org/tex-archive/fonts/LuxiMono/"
depends=('texlive-core')
source=("http://mirrors.ctan.org/fonts/LuxiMono.zip" luxi.maps)
sha256sums=('93f6466649edcb0de608589805c1bc0f04cb364a4efcac3a81fbc38488272293'
            '06584ff8c026ef0c3be3ef2cac14c2fb57b7c317eab26c3c065f0dc3e76bbe36')

package() {
  cd "$srcdir/LuxiMono"

  install -d "$pkgdir/usr/share/texmf-dist/fonts/type1/public/luxi"
  cp *.pfb "$pkgdir/usr/share/texmf-dist/fonts/type1/public/luxi"
  install -d "$pkgdir/usr/share/texmf-dist/fonts/afm/public/luxi"
  cp *.afm "$pkgdir/usr/share/texmf-dist/fonts/afm/public/luxi"
  bsdtar xf ul9.zip -C "$pkgdir/usr/share/texmf-dist/"

  install -d "$pkgdir/usr/share/texmf-dist/fonts/map/dvips/luxi"
  mv "$pkgdir/usr/share/texmf-dist/dvips/config/ul9.map" "$pkgdir/usr/share/texmf-dist/fonts/map/dvips/luxi/"
  rmdir "$pkgdir/usr/share/texmf-dist/dvips/config" "$pkgdir/usr/share/texmf-dist/dvips" 

  install -Dm644 "$srcdir/luxi.maps" "$pkgdir/var/lib/texmf/arch/installedpkgs/luxi.maps"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
