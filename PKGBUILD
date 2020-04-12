# Maintainer: DJ Lucas <dj@lucasit.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Marco A Rojas <marquicus at gmail dot com>

pkgname=ldb-heimdal
pkgnameorig=ldb
pkgver=2.0.8
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
sha512sums=('23a44968c9b4b57deb3f7b7b2466f140b4d8534a07a5e866545dd108c3d305ee4b0ea9bceec3177fcd09a4efcb4876a8283ca58b5c496fcf323b810666e1e79a')

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
