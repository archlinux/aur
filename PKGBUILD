pkgname=fheroes2-git
pkgver=r1763.92ad831d
pkgver() {
	cd "$srcdir/${pkgname%-git}"
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Free implementation of Heroes of the Might and Magic II engine"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/ihhub/fheroes2"
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
makedepends=('gettext' 'git' 'cmake')
conflicts=('fheroes2-svn')
source=(fheroes2::git+https://github.com/ihhub/fheroes2.git)
install=fheroes2.install
md5sums=('SKIP')

build() {
  cd "$srcdir/fheroes2"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
#  make -C ../files/lang
  make
}

package() {
  cd "$srcdir/fheroes2/build"
  make install DESTDIR="$pkgdir"
  install -Dm644 "$srcdir/fheroes2/script/packaging/common/fheroes2.desktop" "$pkgdir/usr/share/applications/fheroes2.desktop"
  install -dm755 "$pkgdir/usr/share/fheroes2/data" "$pkgdir/usr/share/fheroes2/maps"
}

# vim:set ts=2 sw=2 et:
