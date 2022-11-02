# Maintainer: Ciappi <marco.scopesi@gmail.com>
pkgname=fortran-fpm
_pkgname=fpm
pkgver=0.7.0
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
sha256sums=('536dec7d4502221734683b15e6ff64a6ab3f9910df122d18f851c9a68711f91f'
            'd16e45b705029d6d38b0ba7cccab2b9edb48c2f29441473548b866da0389243e')
