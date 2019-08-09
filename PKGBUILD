# Maintainer: wangjiezhe <wangjiezhe AT yandex AT com>

pkgname=librsb
pkgver=1.2.0.8
pkgrel=1
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
md5sums=('15943a0ea16b577a198cadf34f21ec58'
         'SKIP')
validpgpkeys=('1DBB555AEA359B8AAF0C6B88E0E669C8EF1258B8')

prepare() {
  cd "${pkgname}-${pkgver//_/-}"
  sed -i "s/CC -V/CC -v/g" configure aclocal.m4
  sed -i 's/{CC} -V/{CC} -v/g' configure configure.ac
}

build() {
  cd "${pkgname}-${pkgver//_/-}"
  ./autogen.sh
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
