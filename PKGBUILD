# Maintainer: Angelo Nicolson <angelo@idaworks.co.nz>
pkgname=grimoire-git
pkgver=0.1.0.r2.e201689
pkgrel=1
pkgdesc="Terminal-based flashcard drill system with persistent mastery tracking"
arch=('x86_64')
url="https://github.com/AngeloNicolson/grimoire"
license=('MIT')
depends=('ncurses')
makedepends=('cmake' 'git')
provides=('grimoire')
conflicts=('grimoire')
source=("${pkgname}::git+https://github.com/AngeloNicolson/grimoire.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "%s" "$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
}

build() {
  cd "${pkgname}"
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
}
