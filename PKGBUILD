# Maintainer:anon at sansorgan.es 
# Contributor: Jack Rosenthal
# Contributor: David Florness <edwargix@gmail.com>
pkgname=threelayout
_keymap=3l
pkgver=45.d3c9798
pkgrel=2
pkgdesc="Keyboard layout designed by Jack Rosenthal"
arch=(any)
url="https://github.com/jackrosenthal/threelayout"
license=('MIT')
install=threelayout.install
depends=()
makedepends=('ckbcomp' 'coreutils' 'git')
source=('git+https://github.com/jackrosenthal/threelayout.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p $pkgdir/usr/share/X11/xkb/symbols
  mkdir -p $pkgdir/usr/share/kbd/keymaps/i386/$_keymap
  ckbcomp -I$srcdir/$pkgname/linux/xkb/symbols $_keymap | gzip -f - > $_keymap.map.gz
  install -Dm644 $srcdir/$pkgname/linux/xkb/symbols/$_keymap $pkgdir/usr/share/X11/xkb/symbols/$_keymap
  install -Dm644 $srcdir/$_keymap.map.gz $pkgdir/usr/share/kbd/keymaps/i386/$_keymap/$_keymap.map.gz
}
