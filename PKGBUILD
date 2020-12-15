# Maintainer: Azael Reyes <azael.devel@gmail.com>


pkgname=apidb-mariadb
pkgver=5.0.12
pkgrel=1
pkgdesc="API Generator for Database acces."
arch=('x86_64')
license=('GPL')
url="https://github.com/azaeldevel/apidb"
depends=('octetos-db-maria' 'apidb-core')
md5sums=('f0eeeb1c7afb2a942203f5e661ced334')
source=(https://github.com/azaeldevel/apidb/archive/${pkgver}-beta.tar.gz)
conflicts=('apidb')

build() {
    cd apidb-${pkgver}-beta
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPIDB_VERSION_STAGE=alpha -DPLATFORM=LINUX_ARCH -DAPIDBBUILD="CORE;MARIADB" -DAPIDBINSTALL="MARIADB" ..
    make
}

package() {
  cd apidb-${pkgver}-beta/build
  make DESTDIR="$pkgdir" install
}
