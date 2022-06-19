# Maintainer: Ciappi <marco.scopesi@gmail.com>
pkgname=fortran-fpm
_pkgname=fpm
pkgver=0.6.0
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
sha256sums=('365516f66b116a112746af043e8eccb3d854d6feb1fad0507c570433dacbf7be'
            '17a809d512618ddb083b1d8c546a2d98e704b10484f607df7b0b231ddc8ff277')
