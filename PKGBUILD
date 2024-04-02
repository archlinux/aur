# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=tui-sudoku
pkgver=1.0.0
pkgrel=1
pkgdesc="A configurable terminal interface sudoku game, written in Bash, with quite a few features"
arch=('any')
url="https://gitlab.com/christosangel/$pkgname"
license=('GPL2-or-later')
depends=('bash' 'qqwing' 'lolcat')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8b08fabe7e13d550c7918c36eaafbe733d16908ea0119bf25c03e172cee2f44f')

prepare() {
  cd "$pkgname-$pkgver"
  echo -e "#This variable configures the symmetry of the given cells
# in the puzzle. Valid options are:
# none, rotate90, rotate180, mirror, flip, or random

SYMMETRY=random

#Text editor to open config file
PREFERRED_EDITOR=${EDITOR-nano}

#This variable defines the png that shows in the notifications
#These images are in the /usr/share/tui-sudoku/png/ directory.
PREFERRED_PNG=2sudoku.png">$pkgname.config
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r png/ "$pkgdir/usr/share/$pkgname/"
  install -Dm644 $pkgname.config "$pkgdir/etc/$pkgname.config"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
}
