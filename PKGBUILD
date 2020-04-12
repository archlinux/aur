# Maintainer: DJ Lucas <dj@lucasit.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Marco A Rojas <marquicus at gmail dot com>

pkgname=ldb-heimdal
pkgnameorig=ldb
pkgver=2.0.9
pkgrel=1
epoch=1
pkgdesc='Schema-less, ldap like, API and database (built for Samba with Heimdal)'
arch=('x86_64')
url="https://ldb.samba.org/"
source=(https://samba.org/ftp/${pkgnameorig}/${pkgnameorig}-${pkgver}.tar.gz)
license=('GPL3')
depends=('talloc' 'libtevent.so' 'tdb' 'libtdb.so' 'popt' 'lmdb')
makedepends=('python' 'cmocka' 'docbook-xsl' 'tevent')
optdepends=('python: for python bindings')
conflicts=('ldb')
replaces=('ldb')
provides=('ldb' 'libldb.so')
sha512sums=('f4d2480491f16aac7837fa2ff071e81e429bd9b3a365264723245791aad1831a236ffeff0f01f85becb998b224c321b166f3edd3f9a828714b7c3b24aed11a5e')

build() {
  cd ${pkgnameorig}-${pkgver}
  ./configure \
    --prefix=/usr \
    --disable-rpath \
    --disable-rpath-install \
    --bundled-libraries=NONE \
    --builtin-libraries=replace \
    --with-modulesdir=/usr/lib/ldb/modules \
    --with-privatelibdir=/usr/lib/ldb
  make
}

package() {
  cd ${pkgnameorig}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
