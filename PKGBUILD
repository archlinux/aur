# Maintainer: James Harvey <jamespharvey20@gmail.com>
#    * This package is configured to not use a database.
#    * See package sysbench-git for the version configured to use a database.
#    * No namcap warnings or errors

pkgname=sysbench-nodb-git
_pkgname=sysbench
pkgver=0.5.r212.0257f50
pkgrel=1
pkgdesc='Multi-threaded benchmark for evaluating OS parameters for database-loads (git)'
arch=('x86_64' 'i686')
license=('GPL2')
url='https://github.com/akopytov/sysbench'
depends=('glibc')
makedepends=('git')
source=('git+https://github.com/akopytov/sysbench')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(cat sysbench/sb_win.h | grep "define PACKAGE_VERSION" | sed 's|^#define PACKAGE_VERSION "||' | sed 's|"$||').r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --without-mysql
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -Dm644 README.md "${pkgdir}/usr/share/${_pkgname}/README.md"
}
