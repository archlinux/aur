# Maintainer: Caspar Gutsche <caspargutsche1@gmail.com>
pkgname=fortran-stdlib-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Fortran standard library implementation"
arch=('x86_64')
url="https://github.com/fortran-lang/stdlib"
license=('MIT')
depends=('gcc' 'cmake' 'make' 'gcc-fortran')
makedepends=('git' 'python-pipx')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/stdlib"
  pipx install fypp
  PATH={$PATH}:~/.local/bin
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
  cmake --build build --target test
}

package() {
  cd "$srcdir/stdlib"
  sudo cmake --install build  --prefix="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
