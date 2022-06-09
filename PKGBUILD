# Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=hobbits
pkgver=0.53.2
pkgrel=3
pkgdesc="A multi-platform GUI for bit-based analysis, processing, and visualization"
arch=('x86_64')
url="https://github.com/Mahlet-Inc/hobbits"
license=('MIT')
makedepends=(cmake qt5-tools)
depends=("python>=3.8.0" qt5-base)
_dist_filename="$pkgname-$pkgver"
source=(
    "${_dist_filename}::https://github.com/Mahlet-Inc/hobbits/archive/refs/tags/v${pkgver}.tar.gz"
    "git+https://bitbucket.org/jpommier/pffft.git")

sha256sums=('4f617ed8ba466b13e04625eebf121f218da7d82e39b22975e72457970ddfc57c'
            'SKIP')

prepare() {
    cp -r "$srcdir/pffft" "${_dist_filename}"/external/
}

build() {
    cmake -B build -S "${_dist_filename}" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr' \
        -DPFFFT_ENABLE_SIMD=1
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
