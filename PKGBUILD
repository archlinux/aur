# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.7.8
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('custom')
depends=('zlib>=1.2.4' 'readline>=6.1' 'ncurses>=5.7')
makedepends=('python2')
options=('!libtool')
url="http://www.xmlsoft.org/"
source=(ftp://ftp.xmlsoft.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
        largefile64.patch shared_library_versionning.patch)
md5sums=('8127a65e8c3b08856093099b52599c86'
         '5ad4915665608ebfa5b89f7908467a72'
         '84aeb7c6db023eae044e95d9211dba53')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/largefile64.patch"
  patch -Np1 -i "${srcdir}/shared_library_versionning.patch"
  autoreconf -fi
  ./configure --prefix=/usr --with-threads --with-history \
     --with-python=/usr/bin/python2.7
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

