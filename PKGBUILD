# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=novprog
pkgver=3.2.2
pkgrel=1
pkgdesc="A tool to graph your progress in writing a NaNoWriMo style novel"
arch=('i686' 'x86_64')
url="https://gottcode.org/novprog/"
license=('GPL3')
depends=('qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'qt6-tools')
source=("https://gottcode.org/novprog/novprog-${pkgver}.tar.bz2"
        "https://gottcode.org/novprog/novprog-${pkgver}.tar.bz2.asc")
pkg_sha=$(curl -s https://gottcode.org/novprog/ | sed -n '/id="details_source"/{:loop;n;/<b>SHA-256:/{s|^.*<span class="shasum">\([0-9a-f]*\)</span>.*$|\1|p;q};b loop}')
sha256sums=("$pkg_sha" 'SKIP')
validpgpkeys=('57E4D43C10CD7EDB8360C84774FFC7F02C4F6B37')
install=novprog.install

build() {
    cmake -B build -S $pkgname-$pkgver \
          -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
