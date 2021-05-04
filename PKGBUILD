pkgname=fheroes2
pkgver=0.9.3
pkgrel=2
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
  fheroes2.sh
)
md5sums=(
  '35f7e8b3275c62293a7993492701bd4c'
  '1fd1acd411fd906d56add9d7cc74c97d'
  '2ac492a97328fd48f73e572e6f8b8ceb'
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
  install -Dm755 "$srcdir/fheroes2.sh" "$pkgdir/usr/bin/fheroes2.sh"

  install -Dm755 "src/dist/fheroes2" "$pkgdir/usr/bin/fheroes2"
  install -Dm644 "fheroes2.key" "$pkgdir/usr/share/fheroes2/fheroes2.key"
  install -dm755 "$pkgdir/usr/share/fheroes2/data"
  install -dm755 "$pkgdir/usr/share/fheroes2/maps"
}

# vim:set ts=2 sw=2 et:
