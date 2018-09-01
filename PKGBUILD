# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=otf-antykwa-torunska
pkgver=2.08
pkgrel=1
pkgdesc="Open Type Antiqua of Torun, a two-element typeface designed by Zygfryd Gardzielewski"
arch=('any')
url="http://jmn.pl/en/antykwa-torunska/"
license=('CUSTOM')
depends=('fontconfig' 'xorg-font-utils')
source=("$pkgname-$pkgver.zip::http://jmn.pl/pliki/AntykwaTorunska-otf-2_08.zip")
sha256sums=('9f225ce269b5757b31019435077ea84606ba56b7d36a0b94f51dacd370b5868d')

post_install() {
  echo -n "Updating font cache... "
  fc-cache -s >/dev/null
  mkfontscale /usr/share/fonts/OTF
  mkfontdir /usr/share/fonts/OTF
  echo "done."
}

post_upgrade() {
  post_install "$1"
}

post_remove() {
  post_install "$1"
}

package() {
    cd "$srcdir/antt-otf"
    find . -maxdepth 1 -name '*.otf' -execdir install -Dm644 {} "$pkgdir"/usr/share/fonts/OTF/{} \;
}

