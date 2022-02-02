pkgname=kwin-effects-blur-respect-rounded-decorations-git
pkgver=r13.ab7cd99
pkgrel=1
arch=('x86_64')
pkgdesc="A fork of the kwin blur effect that solves the corners bug."
url='https://github.com/Alban-Boissard/kwin-effects-blur-respect-rounded-decorations'
license=('GPL-2.0')
makedepends=('git' 'gcc' 'cmake' 'make' 'gcc' 'extra-cmake-modules' 'kwin')
source=("$pkgname::git+https://github.com/Alban-Boissard/kwin-effects-blur-respect-rounded-decorations.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir/" install
}
