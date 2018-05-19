# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-browser-integration
pkgver=5.12.90
pkgrel=1
pkgdesc='Components necessary to integrate browsers into the Plasma Desktop.'
arch=('i686' 'x86_64')
url='https://github.com/KDE/plasma-browser-integration'
license=('GPL')
depends=('krunner')
makedepends=('extra-cmake-modules' 'git' 'python')
conflicts=('plasma-browser-integration-git')
provides=('plasma-browser-integration')
source=("https://github.com/KDE/plasma-browser-integration/archive/v${pkgver}.tar.gz")
sha256sums=('7433965ef344b59fe276d81ed7400746f4391b4ea0649958ea263bf6589b1066')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
