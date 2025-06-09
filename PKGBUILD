# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pkgname=opencalphad
pkgname=$_pkgname-git
pkgver=6.0.110.ge1f8cb7
pkgrel=2
pkgdesc="A thermodynamic calculation code"
arch=(x86_64)
license=(GPL-3.0-only)
url="http://www.opencalphad.com"
depends=(lapack)
makedepends=(gcc-fortran git)
provides=("$_pkgname")
source=(git+https://github.com/sundmanbo/opencalphad.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/^..//' | sed 's/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  bash ./build_configure
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure \
    --prefix=/usr \
    --enable-openmp \
    --with-lapack \
    --without-python \
    --with-xplot \
    --with-ochelp
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
