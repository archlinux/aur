# Maintainer: Olivier Churlaud <olivier@churlaud.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-latin-greek-cyrillic
provides=('noto-fonts')
conflicts=('noto-fonts')
epoch=1
pkgver=2.015
pkgver_mono=2.014
pkgrel=1
pkgdesc='Google Noto TTF fonts Latin/Greek/Cyrillic'
arch=(any)
url='https://fonts.google.com/noto'
license=(custom:SIL)
source=(https://github.com/notofonts/latin-greek-cyrillic/releases/download/NotoSans-v$pkgver/NotoSans-v$pkgver.zip
        https://github.com/notofonts/latin-greek-cyrillic/releases/download/NotoSansMono-v$pkgver_mono/NotoSansMono-v$pkgver_mono.zip
        https://github.com/notofonts/latin-greek-cyrillic/releases/download/NotoSerif-v$pkgver/NotoSerif-v$pkgver.zip
        66-noto-sans.conf 66-noto-serif.conf 66-noto-mono.conf
        46-noto-sans.conf 46-noto-serif.conf 46-noto-mono.conf)
sha256sums=('0c34df072a3fa7efbb7cbf34950e1f971a4447cffe365d3a359e2d4089b958f5'
            '090cf6c5e03f337a755630ca888b1fef463e64ae7b33ee134e9309c05f978732'
            '0e9a43c8a4b94ac76f55069ed1d7385bbcaf6b99527a94deb5619e032b7e76c1'
            '52684bebf6447be22618d2a04ff37623ec92f9d8ccf6b6f972e5bcbcfee90d69'
            '4459944b63dc083107280f5d7375c69746bf80a09416a4a4909a100e58e5a33a'
            '4526289f59654e2a81dc734669a1ae4e416f9a56d0896ec3741c6bf065baf8a8'
            '83a8faf6a47954075f97a2d555048e2a6689c38603b2ca00150157bf645f4593'
            'c94368b24506770767d003e5bcba589a8e402e489c240ee52453bf3ac7e9b5fa'
            'f5c09b37280d7569b6c99a78511639be4ae25b8c5406464422fe0421fe13a884')

fonts=(NotoSans
       NotoSansMono
       NotoSerif)

package() {
  optdepends=('noto-fonts-cjk: CJK characters' 'noto-fonts-emoji: Emoji characters'
              'noto-fonts-extra: additional variants (condensed, semi-bold, extra-light)')
  provides=(ttf-font
            noto-fonts)

  for fontname in "${fonts[@]}" ; do
    echo "installing $fontname"
    install -Dm644 $fontname/hinted/ttf/*.tt[fc] -t "$pkgdir"/usr/share/fonts/noto
    install -Dm644 OFL.txt -T "$pkgdir"/usr/share/licenses/noto-fonts/LICENSE
  done

  # Move to noto-fonts-extra
  rm -f "$pkgdir"/usr/share/fonts/noto/Noto*{-Condensed,-Semi,-Extra}*.ttf

  # Install fontconfig files
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}

#package_noto-fonts-extra() {
#  pkgdesc+=' - additional variants'
#  depends=(noto-fonts)
#  
#  for fontname in $fonts ; do
#    install -Dm644 $fontname/hinted/ttf/*{-Condensed,-Semi,-Extra}*.tt[fc] -t "$pkgdir"/usr/share/fonts/noto
#  done
#}
