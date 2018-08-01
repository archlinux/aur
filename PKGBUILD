# $Id: PKGBUILD 242171 2015-07-13 18:24:21Z daniel $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=mod_mono
pkgver=3.13
pkgrel=1
pkgdesc="The mono module to make ASP.NET running on top of apache"
arch=('i686' 'x86_64')
url="http://www.go-mono.com"
license=('APACHE')
source=(http://download.mono-project.com/sources/mod_mono/${pkgname}-${pkgver}.tar.gz)
depends=('apache' 'xsp')
sha256sums=('c3657b77dad57cb13e96998ca5b61e0e59412423657240d15a354a9b21dcaf8a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  CFLAGS="${CFLAGS} `apr-1-config --cppflags --includes --cflags`" ./configure \
    --prefix=/usr --sysconfdir=/etc --with-apxs=/usr/bin/apxs \
    --with-mono-prefix=/usr --with-apr-config=/usr/bin/apr-1-config
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  mkdir -p ${pkgdir}/etc/httpd/conf/extra
  mv ${pkgdir}/etc/httpd/conf/mod_mono.conf ${pkgdir}/etc/httpd/conf/extra/mod_mono.conf
}

