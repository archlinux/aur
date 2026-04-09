# Maintainer: MilakyS <155958845+MilakyS@users.noreply.github.com>

pkgname=mks-git
_pkgname=MKS-interpreter
pkgver=0.r38.g9773477
pkgrel=1
pkgdesc="Small experimental scripting language and interpreter written in C"
arch=('x86_64')
url="https://github.com/MilakyS/MKS-interpreter"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('mks')
conflicts=('mks')
source=("$_pkgname::git+https://github.com/MilakyS/MKS-interpreter.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$srcdir/$_pkgname" \
        -B "$srcdir/build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
