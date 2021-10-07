# Initial Contribution: Benjamin Chretien <chretien at lirmm dot fr>
# Maintainer: Guilhem Saurel <gsaurel at laas dot fr>

pkgname=urdfdom
pkgver=3.0.0
pkgrel=1
pkgdesc="The URDF (U-Robot Description Format) library provides core data structures and a simple XML parsers for populating the class data structures from an URDF file."
arch=('i686' 'x86_64')
url="https://github.com/ros/$pkgname"
license=('BSD')
depends=('tinyxml' 'console-bridge' 'urdfdom-headers')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3c780132d9a0331eb2116ea5dac6fa53ad2af86cb09f37258c34febf526d52b4')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
