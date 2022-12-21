pkgname=fheroes2
pkgver=1.0.0
pkgrel=1
pkgdesc="Recreation of the Heroes of Might and Magic II game engine"
arch=('i686' 'x86_64' 'armv7h')
url="https://ihhub.github.io/fheroes2/"
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
optdepends=('curl: download demo version files'
            'python: extract animation resources from GOG CD image'
            'wget: download demo version files'
            'unzip: unpack demo version files')
makedepends=('cmake' 'gettext' 'ninja')
conflicts=('fheroes2-git')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/ihhub/$pkgname/archive/$pkgver.tar.gz
)
sha256sums=('80468b4eaf128ac5179a3416a02e2a2ef4ab34d90876b179fccd8d505f950440')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -B build -G Ninja -S . \
        -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install build

  install -dm755 "$pkgdir/usr/share/fheroes2/maps"
}

# vim:set ts=2 sw=2 et:
