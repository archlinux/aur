# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=novprog
pkgver=3.1.6
pkgrel=1
pkgdesc="A tool to graph your progress in writing a NaNoWriMo style novel"
arch=('i686' 'x86_64')
url="https://gottcode.org/novprog/"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("https://gottcode.org/novprog/novprog-${pkgver}-src.tar.bz2"
        "https://gottcode.org/novprog/novprog-${pkgver}-src.tar.bz2.asc")
pkg_sha=$(curl -s https://gottcode.org/novprog/ | sed -n '/id="osSource"/{:loop;n;/<b>SHA-256:/{s|^.*<span class="shasum">\([0-9a-f]*\)</span>.*$|\1|p;q};b loop}')
sha256sums=("$pkg_sha" 'SKIP')
validpgpkeys=('57E4D43C10CD7EDB8360C84774FFC7F02C4F6B37')
install=novprog.install

build() {
  cd $pkgname-$pkgver
  qmake PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir" install
}
