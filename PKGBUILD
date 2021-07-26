pkgname=fheroes2
pkgver=0.9.5
pkgrel=2
pkgdesc="Free remake of Heroes of Might and Magic II game engine"
arch=('i686' 'x86_64' 'armv7h')
url="https://ihhub.github.io/fheroes2/"
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf')
optdepends=('curl: download demo version files'
            'wget: download demo version files'
            'unzip: unpack demo version files')
makedepends=('gettext')
conflicts=('fheroes2-git' 'fheroes2-svn')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/ihhub/$pkgname/archive/$pkgver.tar.gz
)
md5sums=(
  'a3764c652188b69dbbc1929954e94861'
)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CFLAGS+=' -DCONFIGURE_FHEROES2_DATA=\"/usr/share/fheroes2\"'
  export CXXFLAGS+=' -DCONFIGURE_FHEROES2_DATA=\"/usr/share/fheroes2\"'
  make RELEASE=1 FHEROES2_IMAGE_SUPPORT=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "src/dist/fheroes2" "$pkgdir/usr/bin/fheroes2"
  install -Dm644 "script/packaging/common/fheroes2.desktop" "$pkgdir/usr/share/applications/fheroes2.desktop"
  install -Dm755 "script/demo/demo_unix.sh" "$pkgdir/usr/share/fheroes2/demo_unix.sh"
  install -Dm644 "fheroes2.key" "$pkgdir/usr/share/fheroes2/fheroes2.key"
  install -dm755 "$pkgdir/usr/share/fheroes2/data"
  install -dm755 "$pkgdir/usr/share/fheroes2/maps"
  install -Dm644 src/resources/fheroes2.png "$pkgdir/usr/share/pixmaps/fheroes2.png"
}

# vim:set ts=2 sw=2 et:
