# Maintainer: kfgz <kfgz at interia pl>
# Contributor: watashi <zejun dot wu at gmail dot com>

pkgname=xmount
pkgver=0.7.3
pkgrel=1
pkgdesc="Tool to crossmount between multiple input and output harddisk image files"
arch=('i686' 'x86_64')
license=('GPL')
url="https://www.pinguin.lu"
depends=('fuse' 'libewf' 'afflib')
options=(!makeflags)
source=(http://files.pinguin.lu/${pkgname}-${pkgver}.tar.gz)
sha256sums=('ab2240f79ebfa2119452d8f5327dbc5b7a4d043747d36d897b8f5a207dab9888')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  #autoreconf -f
  #LIBS='-lz' ./configure --prefix=/usr
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
