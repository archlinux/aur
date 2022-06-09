# Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=hobbits
pkgver=0.53.2
pkgrel=2
pkgdesc="A multi-platform GUI for bit-based analysis, processing, and visualization"
arch=('x86_64')
url="https://github.com/Mahlet-Inc/hobbits"
license=('MIT')
makedepends=(cmake qt5-tools)
depends=("python>=3.8.0" qt5-base pffft-git)
_dist_filename="$pkgname-$pkgver"
source=("${_dist_filename}::https://github.com/Mahlet-Inc/hobbits/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('4f617ed8ba466b13e04625eebf121f218da7d82e39b22975e72457970ddfc57c')

build() {
    cmake -B build -S "${_dist_filename}"                       \
        -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr'   \
        -DUSE_SYSTEM_PFFFT=1                                    \
        -DCMAKE_INSTALL_PREFIX="$pkg/usr"                       \
        -DPFFFT_INCLUDE_DIRS=/usr/include/pffft                 \
        -DPFFFT_LIBRARIES=/usr/include/pffft/pffft.h
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
