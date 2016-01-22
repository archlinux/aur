# Maintainer: <craven@gmx.net>
# Former Maintainer: Milos Negovanovic <milos.negovanovic@gmail.com>

pkgname=ocilib
pkgver=4.2.0
pkgrel=1
pkgdesc='OCILIB (C and C++ Driver for Oracle)'
arch=('i686' 'x86_64')
url='https://github.com/vrogier/ocilib'
license=('LGPL2')
source=("https://github.com/vrogier/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-gnu.tar.gz")
md5sums=('2705be616149b68419e27dafec0d7010')
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

