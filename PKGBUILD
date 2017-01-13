# Maintainer: TingPing <tingping@fedoraproject.org>

_fontname=EmojiOneColor-SVGinOT
pkgname=ttf-emojione-color
pkgver=1.3
pkgrel=3
pkgdesc='A color and B&W emoji SVGinOT font built from EmojiOne'
arch=('any')
url='https://github.com/eosrei/emojione-color-font'
depends=('fontconfig' 'xorg-font-utils' 'xorg-fonts-encodings')
license=('CC-BY-4.0')
install=ttf-font.install
source=("https://github.com/eosrei/emojione-color-font/releases/download/v$pkgver/$_fontname-Linux-$pkgver.tar.gz"
        "64-$pkgname.conf"
        'ttf-font.install')
sha256sums=('afb397b2a141cd414e73e1072dbe8ff4a5e69eb38131304a99e4cd93ba348498'
            '6f589b3879f20baf194d8a1574900391691b58c7d04990921ade9dd8ad74694a'
            '4ab991dcf41e5a97cd163288af6e4e2233b17c7c3a9e352ae24e06b4a08a4b0e')

package() {
  cd "$_fontname-Linux-$pkgver"

  _fontdir="/usr/share/fonts/TTF"
  _fonttemplatedir="/etc/fonts/conf.avail"
  _fontconfigdir="/etc/fonts/conf.d"

  install -d "$pkgdir/$_fontdir"
  install "$_fontname.ttf" "$pkgdir/$_fontdir"

  install -d "$pkgdir/$_fontconfigdir"
  install -d "$pkgdir/$_fonttemplatedir"
  install -m644 "$srcdir/64-$pkgname.conf" "$pkgdir/$_fonttemplatedir"
  ln -s "$_fonttemplatedir/64-$pkgname.conf" "$pkgdir/$_fontconfigdir/64-$pkgname.conf"

  install -D LICENSE-CC-BY.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
