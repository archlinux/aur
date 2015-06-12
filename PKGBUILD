# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Matthias Maennich <arch@maennich.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=apiextractor-git
pkgver=0.3.2.322.g744d018
pkgrel=1
pkgdesc="Collects information about libraries from its header files and merges it with user written files (typesystem) describing how the library should be exposed as a binding on the target language."
url="http://www.pyside.org"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('qt4>=4.7' 'openssl' 'libxslt' 'libxml2')
makedepends=('cmake' 'automoc4' 'git')
conflicts=("apiextractor")
provides=("apiextractor")
source=($pkgname::git://github.com/PySide/Apiextractor.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
    cd "$srcdir/$pkgname"
        
    mkdir -p build && cd build
    cmake ../ -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir" install
}


