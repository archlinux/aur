# Maintainer: b1u3rchie <b1u3rchie@larpdhq.org>
pkgname=plusplusfetch-git
pkgver=r56.1d22e0e
pkgrel=1
pkgdesc="Simple fetch tool written in C++"
arch=("x86_64")
url="https://codeberg.org/melvi/plusPlusFetch.git"
license=('MIT')
conflicts=("plusplusfetch")
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake')
sha256sums=('SKIP') 

source=("plusplusfetch::git+https://codeberg.org/melvi/plusPlusFetch.git")

pkgver() {
  cd "plusplusfetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "plusplusfetch" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
