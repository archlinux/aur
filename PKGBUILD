# Maintainer: Josh Hoffer <hoffer dot joshua at gmail dot com >
# Contributor: Jack Rosenthal
# Contributor: David Florness <edwargix@gmail.com>
pkgname=threelayout
pkgver=41.66f2e67
pkgrel=1
pkgdesc="Keyboard layout designed by Jack Rosenthal"
arch=(any)
url="https://github.com/jackrosenthal/threelayout"
license=('MIT')
install=threelayout.install
depends=()
makedepends=('ckbcomp' 'coreutils')
source=('git+https://github.com/jackrosenthal/threelayout.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p $pkgdir/usr/share/X11/xkb/symbols
  mkdir -p $pkgdir/usr/share/kbd/keymaps/i386/$pkgname
  ckbcomp 3l | gzip -f - > $pkgname.map.gz
  install -Dm644 $srcdir/3l $pkgdir/usr/share/X11/xkb/symbols/3l
  install -Dm644 $srcdir/$pkgname.map.gz $pkgdir/usr/share/kbd/keymaps/i386/3l/3l.map.gz
}

