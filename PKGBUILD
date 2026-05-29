# Maintainer: Nathan <me@nathan.rip>
pkgname=ezcut
pkgver=0.1.3
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

sha256sums=('ddc5444ef5861bc1c1a7bde80dbe479fd48ad6b2f8dd137f036a9054a12a1153')

build() {
    cmake -B build -S "e-z-cut-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
