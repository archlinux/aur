pkgname=fheroes2
pkgver=0.9.3
pkgrel=1
pkgdesc="Free implementation of Heroes of Might and Magic II game engine"
arch=('i686' 'x86_64' 'armv7h')
url="https://ihhub.github.io/fheroes2/"
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'sdl2_ttf' 'tinyxml')
makedepends=('gettext')
conflicts=('fheroes2-git' 'fheroes2-svn')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/ihhub/$pkgname/archive/$pkgver.tar.gz
  fheroes2.desktop
)
md5sums=(
  '35f7e8b3275c62293a7993492701bd4c'
  '8e8e2b9097d886d9115f4541e943fa9e'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CFLAGS+=' -DCONFIGURE_FHEROES2_DATA=\"/usr/share/fheroes2\"'
  export CXXFLAGS+=' -DCONFIGURE_FHEROES2_DATA=\"/usr/share/fheroes2\"'
  make RELEASE=1 WITHOUT_BUNDLED_LIBS=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "$srcdir/fheroes2.desktop" "$pkgdir/usr/share/applications/fheroes2.desktop"
  install -Dm644 "fheroes2.key" "$pkgdir/usr/share/fheroes2/fheroes2.key"

  install -Dm755 "src/dist/fheroes2" "$pkgdir/usr/bin/fheroes2"
  install -dm755 "$pkgdir/usr/share/fheroes2/data"
  install -dm755 "$pkgdir/usr/share/fheroes2/maps"
}

# vim:set ts=2 sw=2 et:
