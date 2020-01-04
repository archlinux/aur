# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libfes
pkgver=0.2
pkgrel=2
pkgdesc="A software library devoted to solving systems of polynomial equations over F2"
arch=(x86_64)
url="https://www.lifl.fr/~bouillag/fes/"
license=(GPL3)
depends=(glibc)
makedepends=(python)
source=("https://bitbucket.org/fes/fes/downloads/fes-$pkgver.spkg")
sha256sums=('e85db060a1ca63bc6ed9ace9cb213dd76875c91da54e202ec8c207717ee98ef8')

prepare() {
  cd fes-$pkgver/src
  sed -e 's/ -Werror//' -i configure.ac
  autoreconf -vi
}

build() {
  cd fes-$pkgver/src
  ./configure --prefix=/usr
  make
}

package() {
  cd fes-$pkgver/src
  make install DESTDIR="$pkgdir"
}

