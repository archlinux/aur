# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=sdl12-compat
_commit=030111ab691581d2eb0cd44586d69a4398185560
pkgver=1.2.52
pkgrel=1
pkgdesc="Provides a binary and source compatible API for programs written against SDL 1.2, but it uses SDL 2.0 behind the scenes."
url="https://github.com/libsdl-org/sdl12-compat.git"
depends=('sdl2' 'glu')
makedepends=('cmake' 'git')
arch=('i686' 'x86_64')
conflicts=('sdl')
provides=('sdl=1.12.15')
license=('zlib')
source=("git+https://github.com/libsdl-org/sdl12-compat.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../sdl12-compat
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/sdl12-compat/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
