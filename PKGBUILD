pkgname=fheroes2-git
pkgver=r1028.b640d527
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
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf')
makedepends=('subversion' 'gettext')
conflicts=('fheroes2-svn')
source=(fheroes2::git+https://github.com/ihhub/fheroes2.git
        fheroes2.desktop
        fheroes2.sh)
install=fheroes2.install
md5sums=('SKIP'
         '8e8e2b9097d886d9115f4541e943fa9e'
         'a39dd6625e7d1582c85087937e00f074')

build() {
  cd "$srcdir/fheroes2"
  make RELEASE=1 WITH_AI=simple
}

package() {
  cd "$srcdir/fheroes2"
  install -Dm755 "$srcdir/fheroes2.sh" "$pkgdir/usr/bin/fheroes2"
  install -Dm644 "$srcdir/fheroes2.desktop" "$pkgdir/usr/share/applications/fheroes2.desktop"

#  install -Dm644 "image/fheroes2_32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/fheroes2.png"
  install -Dm755 "src/dist/fheroes2" "$pkgdir/usr/share/fheroes2/fheroes2"
#  install -Dm644 "fheroes2.cfg" "$pkgdir/usr/share/fheroes2/fheroes2.cfg"

  install -dm755 "$pkgdir/usr/share/fheroes2/data" "$pkgdir/usr/share/fheroes2/maps"
}

# vim:set ts=2 sw=2 et:
