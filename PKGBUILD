# Maintainer: Nathan <me@nathan.rip>
pkgname=ezcut
pkgver=0.1.4
pkgrel=1
pkgdesc="Lightweight video cutter powered by ffmpeg"
arch=('x86_64')
url="https://github.com/e-z-services/e-z-cut"
license=('MIT')

depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-multimedia'
    'ffmpeg'
)

makedepends=(
    'cmake'
    'ninja'
    'qt6-tools'
)

provides=('quickcut')
conflicts=('quickcut')

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/e-z-services/e-z-cut/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('be5e86799dfcf2e9dfb37d4cf8b0e9ec46249649e4a4f41149fd8fe3a11e2630')

build() {
    cmake -B build -S "e-z-cut-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
