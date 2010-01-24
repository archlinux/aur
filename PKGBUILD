# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.7.6
pkgrel=2
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('custom')
depends=('zlib>=1.2.3.3' 'readline>=6.0' 'ncurses>=5.7')
makedepends=('python')
options=('!libtool')
url="http://www.xmlsoft.org/"
source=(ftp://ftp.xmlsoft.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
        largefile64.patch zlib.patch)
md5sums=('7740a8ec23878a2f50120e1faa2730f2'
         '5ad4915665608ebfa5b89f7908467a72'
         '0365d5397164b8739219e56e5ca069d1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/largefile64.patch" || return 1
  patch -p1 -i "${srcdir}/zlib.patch" || return 1
  ./configure --prefix=/usr --with-threads --with-history || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}
