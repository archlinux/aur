# Maintainer: wangjiezhe <wangjiezhe AT yandex AT com>

pkgname=librsb
pkgver=1.2.0_rc5
pkgrel=2
pkgdesc="A shared memory parallel sparse matrix library including Sparse BLAS."
arch=('any')
url="http://sourceforge.net/projects/librsb"
license=('LGPL3')
depends=()
makedepends=()
optdepends=()
options=()
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver//_/-}.tar.gz"
        "https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver//_/-}.tar.gz.asc")
md5sums=('a8144ce30621939c05ea6d328a00a35b'
         'SKIP')
validpgpkeys=('1DBB555AEA359B8AAF0C6B88E0E669C8EF1258B8')

prepare() {
  cd "${pkgname}-${pkgver//_/-}"
  sed -i "s/CC -V/CC -v/g" configure aclocal.m4
  sed -i 's/{CC} -V/{CC} -v/g' configure configure.ac
}

build() {
  cd "${pkgname}-${pkgver//_/-}"
  ./configure --prefix=/usr \
              --enable-fortran-module-install \
              CFLAGS='-fPIC -g -O3' FCFLAGS='-fPIC -g -O3'
  make
}

check() {
  cd "${pkgname}-${pkgver//_/-}"
  make -k check
}

package() {
  cd "${pkgname}-${pkgver//_/-}"
  make DESTDIR="${pkgdir}/" install
}
