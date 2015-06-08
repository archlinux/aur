# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ntrack
pkgver=16
pkgrel=3
epoch=1
pkgdesc="A network connectivity tracking library"
arch=('i686' 'x86_64')
url="http://launchpad.net/ntrack/"
license=('LGPL')
depends=('qt4' 'libnl')
makedepends=('python2')
options=('!libtool' '!emptydirs')
source=("http://launchpad.net/${pkgname}/main/0${pkgver}/+download/${pkgname}-0${pkgver}.tar.gz"
        'libnl3.patch')
md5sums=('21691dac43460a6791cba3decbc68242'
         '0a1f6b7f9a01c323e81d6da95cad93cd')

build() {
  cd "${srcdir}/${pkgname}-0${pkgver}"
  patch -p1 -i "${srcdir}"/libnl3.patch

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-0${pkgver}"
  make DESTDIR="${pkgdir}" install
}
