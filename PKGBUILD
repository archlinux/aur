# Maintainer: thacoon <thacoon@posteo.de>
pkgname=tilengine-git
pkgver=r170.ea888ae

pkgrel=1
pkgdesc="The 2D retro graphics engine"
arch=("x86_64")
url="https://github.com/megamarc/Tilengine.git"
license=('Mozilla Public License 2.0')

depends=('libpng' 'sdl2')
makedepends=('gcc' 'make')

source=("git+https://github.com/megamarc/Tilengine.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/Tilengine/src
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/Tilengine/src
    make
}

package() {
    install -Dm755 "$srcdir/Tilengine/src/libTilengine.so" "$pkgdir/usr/lib/libTilengine.so"
    install -Dm644 "$srcdir/Tilengine/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/Tilengine/include/Tilengine.h" "$pkgdir/usr/include/Tilengine.h"
}
