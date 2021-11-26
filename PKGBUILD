# Maintainer: Ciappi <marco.scopesi@gmail.com>
pkgname=fortran-fpm
_pkgname=fpm
pkgver=0.5.0
pkgrel=1
epoch=
pkgdesc="A Fortran package manager and build system"
arch=('x86_64')
url="https://github.com/fortran-lang/fpm"
license=('MIT')
groups=()
depends=("git")
makedepends=("gcc-fortran")
checkdepends=()
optdepends=()
provides=()
conflicts=("fpm")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fortran-lang/fpm/releases/download/v$pkgver/$_pkgname-$pkgver.zip"
        "https://github.com/fortran-lang/fpm/releases/download/v$pkgver/"$_pkgname-$pkgver.F90)
sha256sums=('e4a06956d2300f9aa1d06bd3323670480e946549617582e32684ded6921a921e'
            '53bba4d3d09d875d513ed4309a3defe414fa727dbcdeb38e4fdcf094e19c0257')
noextract=()

prepare() {
  mkdir -p "$srcdir/$_pkgname-$pkgver/_bootstrap"
  cd "$srcdir/$_pkgname-$pkgver"

  mv "$srcdir/$_pkgname-$pkgver.F90" "$srcdir/$_pkgname-$pkgver/_bootstrap/$_pkgname.F90"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  gfortran -J _bootstrap/  _bootstrap/fpm.F90 -o _bootstrap/fpm
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"

  _bootstrap/fpm test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  _bootstrap/fpm install --flag "-g -fbacktrace -O3" --prefix "$pkgdir/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
