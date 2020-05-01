# Maintainer: DJ Lucas <dj@lucasit.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Marco A Rojas <marquicus at gmail dot com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
pkgname=ldb-heimdal
pkgnameorig=ldb
pkgver=2.0.10
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
sha512sums=('51954969e3121295ea99856c254f455cb746102e9d7895fbd7c66997f33763ae4522ed456e4bae7921b2edd73575a0a10738d21a90a067a57ff770cf0fe35aef')

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
