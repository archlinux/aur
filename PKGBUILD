# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=sdl2pp
_pkgname=libSDL2pp
pkgver=0.16.0
pkgrel=1
pkgdesc="SDL2 wrapper for C++11"
arch=('any')
url="https://github.com/libSDL2pp/libSDL2pp"
license=('zlib')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_pkgname/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('f5a1f41982421c0e0386960c5aff3d7a')

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    cmake -DCMAKE_INSTALL_PREFIX=/usr . \
          -DCMAKE_BUILD_TYPE=Release \
          -DSDL2PP_WITH_EXAMPLES=false \
          -DSDL2PP_WITH_TESTS=false \
          -DSDL2PP_ENABLE_LIVE_TESTS=false

    make
}

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install

    install -Dm644 ./COPYING.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
