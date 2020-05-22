# Maintainer: DJ Lucas <dj@lucasit.com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Marco A Rojas <marquicus at gmail dot com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=ldb-heimdal
_pkgname=ldb
pkgver=2.1.3
pkgrel=1
epoch=1
pkgdesc='Schema-less, ldap like, API and database (built for Samba with Heimdal)'
arch=('x86_64' 'i686')
url="https://ldb.samba.org/"
source=(https://samba.org/ftp/${_pkgname}/${_pkgname}-${pkgver}.tar{.gz,.asc})
license=('GPL3')
depends=('talloc' 'libtevent.so' 'tdb' 'libtdb.so' 'popt' 'lmdb')
makedepends=('python' 'cmocka' 'docbook-xsl' 'tevent')
optdepends=('python: for python bindings')
conflicts=('ldb')
replaces=('ldb')
provides=('ldb' 'libldb.so')
validpgpkeys=('9147A339719518EE9011BCB54793916113084025') # Samba Library Distribution Key <samba-bugs@samba.org>
sha512sums=('3f5adf5ed6c98cefce56ba47c986c5d59619731def8fa66440957aba1483de19bcfdc4ec5498d34db70753312b1ad47b864020269df924d3d431c8d4d223af10'
            'SKIP')

build() {
  cd ${_pkgname}-${pkgver}
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
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
