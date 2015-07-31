# Maintainer: Felix Braun <hazzl@falix.de>
pkgname=zbackup
pkgver=1.4.2
pkgrel=1
pkgdesc='A versatile deduplicating backup tool'
arch=('i686' 'x86_64')
url='http://zbackup.org'
license=('GPL2')
depends=('xz' 'openssl' 'protobuf')
makedepends=('cmake')
source=(https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('eceb8c81ce593205cb51c6bb74031764')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
  cd tartool
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  cd tartool
  make DESTDIR="${pkgdir}" install
}
