# Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=hobbits
pkgver=0.54.0
pkgrel=1
pkgdesc="A multi-platform GUI for bit-based analysis, processing, and visualization"
arch=('x86_64')
url="https://github.com/Mahlet-Inc/hobbits"
license=('MIT')
makedepends=(cmake qt5-tools)
depends=("python>=3.9.0" qt5-base)
_dist_filename="$pkgname-$pkgver"
source=(
    "${_dist_filename}::https://github.com/Mahlet-Inc/hobbits/archive/refs/tags/v${pkgver}.tar.gz"
    "git+https://bitbucket.org/jpommier/pffft.git")

sha256sums=('4104cea0af5cdf0f8e735dc883e60ce29874f0ffef72de7dcd07c2d7b535513e'
            'SKIP')

prepare() {
    cp -r "$srcdir/pffft" "${_dist_filename}/external/"
}

build() {
    cmake -B build -S "${_dist_filename}" \
        -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX='/usr' -DPFFFT_ENABLE_SIMD=1
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
