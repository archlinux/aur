# Maintainer: Afnan Enayet <afnan at afnan.io>
pkgname=blaze
provides=('blaze')
pkgver=3.5
pkgrel=1
pkgdesc='An open-source, high-performance C++ math library for dense and sparse arithmetic.'
url='https://bitbucket.org/blaze-lib/blaze'
arch=('any')
license=('BSD')
makedepends=('cmake' 'git' 'make' 'gcc')
sha256sums=('f93a4c0535120db26b8e13dd8fce9eeed70e93e42d20f37da968ff86551ce319')
source=("$pkgname-$pkgver.tar.gz::https://bitbucket.org/blaze-lib/blaze/get/v3.5.tar.gz")

prepare() {
    mv "blaze-lib-blaze-cac64f2b3500" "$pkgname-$pkgver"
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
