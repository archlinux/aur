# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.6.32
pkgrel=3
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('custom')
depends=('zlib>=1.2.3.3' 'readline>=5.2-8' 'ncurses>=5.6-7')
makedepends=('python>=2.5')
options=('!libtool')
source=(ftp://ftp.xmlsoft.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
	largefile64.patch)
url="http://www.xmlsoft.org/"
md5sums=('2621d322c16f0257e30f0ff2b13384de' '5ad4915665608ebfa5b89f7908467a72')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/largefile64.patch || return 1
  ./configure --prefix=/usr --with-threads --with-history || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
}
