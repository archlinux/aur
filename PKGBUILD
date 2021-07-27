pkgname=fheroes2-git
pkgver=r1756.f00d0d75
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
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'sdl2_ttf' 'tinyxml')
makedepends=('gettext' 'git' 'cmake')
conflicts=('fheroes2-svn')
source=(fheroes2::git+https://github.com/ihhub/fheroes2.git
        fheroes2.desktop)
install=fheroes2.install
md5sums=('SKIP'
         '8e8e2b9097d886d9115f4541e943fa9e')

build() {
  cd "$srcdir/fheroes2"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/fheroes2/build"
  make install DESTDIR="$pkgdir"
#  mv "$pkgdir"/usr/bin/fheroes2 "$pkgdir"/usr/bin/fheroes2-bin
#  install -Dm755 "$srcdir/fheroes2.sh" "$pkgdir/usr/bin/fheroes2"
  install -Dm644 "$srcdir/fheroes2.desktop" "$pkgdir/usr/share/applications/fheroes2.desktop"
  install -dm755 "$pkgdir/usr/share/fheroes2/data" "$pkgdir/usr/share/fheroes2/maps"
}

# vim:set ts=2 sw=2 et:
