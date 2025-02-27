# Maintainer: Farzin Monsef <farzin [at] inphraz [dot] ir>
# Contributor: ecraven <craven@gmx.net>
# Contributor: Milos Negovanovic <milos.negovanovic@gmail.com>

pkgname=ocilib
pkgver=4.7.7
pkgrel=1
pkgdesc='OCILIB (C and C++ Driver for Oracle)'
arch=('i686' 'x86_64')
url='https://github.com/vrogier/ocilib'
license=('Apache-2.0')
source=("https://github.com/vrogier/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-gnu.tar.gz")
sha256sums=('13a3e5ecf5f972856df77e4e974cc73d6fed77ac2a24da241a8bfc67f8c1dd6c')
depends=(oracle-instantclient-sdk)

build() {
  if ! env | grep -q ^ORACLE_HOME=
  then
      echo ORACLE_HOME is not exported. Make sure you installed the Oracle libraries correctly.
      exit 1
  fi
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-oracle-headers-path=/usr/include --with-oracle-lib-path=/usr/lib
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

