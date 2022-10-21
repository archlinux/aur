# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-mariadb
pkgver=5.15.0
phase=alpha
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('octetos-db-maria' 'apidb')
md5sums=('4910074cdb5a44a08180df2075a69082')
source=(https://github.com/azaeldevel/apidb/archive/${pkgver}-${phase}.tar.gz)

build() {
    cd apidb-${pkgver}-${phase}
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=${phase} -DPLATFORM=LINUX_ARCH -DAPIDBBUILD="CORE;MARIADB" -DAPIDBINSTALL="MARIADB" ..
    make
}

package() {
  cd apidb-${pkgver}-${phase}/build
  make DESTDIR="$pkgdir" install
}
