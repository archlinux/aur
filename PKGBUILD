# Maintainer: Valente (soyhyak) <talvezhyak@gmail.com>
pkgname=bste-git
pkgver=r3.5a6e2cc
pkgrel=1
pkgdesc="Basic and Simple Text Editor - A rock-solid Qt6 text editor"
arch=('x86_64')
url="https://github.com/soyhyak/BSTE"
license=('MIT')
depends=('qt6-base')
makedepends=('git' 'cmake' 'qt6-tools')
provides=('bste')
conflicts=('bste')
source=("BSTE::git+https://github.com/soyhyak/BSTE.git")
sha256sums=('SKIP')

pkgver() {
  cd "BSTE"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Compilamos usando el CMakeLists profesional que ya tienes
  cmake -B build -S "BSTE" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
