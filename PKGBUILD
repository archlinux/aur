# Maintainer: Afnan Enayet <afnan at afnan.io>
pkgname=blaze
provides=('blaze')
pkgver=3.7
pkgrel=3
pkgdesc='An open-source, high-performance C++ math library for dense and sparse arithmetic.'
url='https://bitbucket.org/blaze-lib/blaze'
arch=('any')
license=('BSD')
makedepends=('cmake' 'git' 'make' 'gcc' 'blas' 'lapack')
sha256sums=('a24328da1deabc8e15295fbbaa242d0b37cda8d4e05d0e6772926308c6a953f0')
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/blaze-lib/blaze/get/v${pkgver}.tar.gz")

prepare() {
    mv "blaze-lib-blaze-51fff70fcc70" "$pkgname-$pkgver"
}

build() {
    cd $pkgname-$pkgver
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make -j$(nproc)
}

package() {
    cd $pkgname-$pkgver/build
    make DESTDIR="$pkgdir/" install
}
