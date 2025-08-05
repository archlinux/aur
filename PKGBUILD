# Maintainer: Farzin Monsef <farzin [at] inphraz [dot] ir>
# Contributor: ecraven <craven@gmx.net>
# Contributor: Milos Negovanovic <milos.negovanovic@gmail.com>

pkgname=ocilib
pkgver=4.8.0
pkgrel=1
pkgdesc='OCILIB (C and C++ Driver for Oracle)'
arch=('i686' 'x86_64')
url='https://github.com/vrogier/ocilib'
license=('Apache-2.0')
source=("https://github.com/vrogier/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-gnu.tar.gz")
sha256sums=('c1e39af347292fd5af1873513ba86bed1065d673a311cd72b8fc0b53aeadd292')
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

