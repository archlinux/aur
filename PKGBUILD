# Maintainer: Afnan Enayet <afnan at afnan.io>
pkgname=blaze
provides=('blaze')
pkgver=3.7
pkgrel=2
pkgdesc='An open-source, high-performance C++ math library for dense and sparse arithmetic.'
url='https://bitbucket.org/blaze-lib/blaze'
arch=('any')
license=('BSD')
makedepends=('cmake' 'git' 'make' 'gcc' 'blas' 'lapack')
sha256sums=('7ce39023c0c20569355d39ba31ce4584041de898a7f0eb13c91d75532b173bdb')
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
