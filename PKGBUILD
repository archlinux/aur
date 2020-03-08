# Original build: fermyon <antifermion@protonmail.com>
# Maintainer: Jakub Okoński <jakub@okonski.org>
_pkgname=rocm-cmake
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="cmake modules for common build tasks needed for the ROCM software stack"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/rocm-cmake"
license=('MIT')
makedepends=('git' 'cmake')
provides=('rocm-cmake')
conflicts=('rocm-cmake')
source=('git+https://github.com/RadeonOpenCompute/rocm-cmake.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        "$srcdir/$_pkgname"
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
