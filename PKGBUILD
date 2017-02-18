# $Id: PKGBUILD 260530 2016-03-02 18:25:02Z foutrelis $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=htdig
pkgver=3.2.0b6
pkgrel=11
pkgdesc="Scripts and HTML code needed for using ht://Dig as a web search engine"
url="http://www.htdig.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        'gcc4.3.patch'
        'CVE-2007-6110.patch')
md5sums=('8b9b9587a411ac7dd278fa5413428960'
         '2aeda683f95b58efc0978d7fe951de59'
         '0d9099d3b5a32d322a8e0240f85a3578')

prepare() {
  cd ${pkgname}-${pkgver}

  patch -p1 -i "${srcdir}/gcc4.3.patch"
  patch -p1 -i "${srcdir}/CVE-2007-6110.patch"
}

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --with-config-dir=/etc/htdig \
    --with-default-config-file=/etc/htdig/htdig.conf \
    --with-database-dir=/var/lib/htdig/db \
    --with-cgi-bin-dir=/usr/bin \
    --with-common-dir=/usr/share/doc/htdig \
    --with-search-dir=/usr/share/doc/htdig \
    --with-image-dir=/usr/share/doc/htdig \
    --localstatedir=/var/lib/htdig \
    --with-ssl
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
