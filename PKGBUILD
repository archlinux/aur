# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=waylib-git
pkgver=r221.24784fa
pkgrel=1
pkgdesc='A wrapper for wlroots based on Qt.'
arch=('x86_64' 'aarch64')
url="https://github.com/vioken/waylib"
license=('Apache' 'GPL2' 'GPL3' 'LGPL3')
depends=()
makedepends=('git' 'qwlroots' 'ninja')
provides=('waylib')
source=("$pkgname::git+https://github.com/vioken/waylib")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $pkgname
  cmake -B . -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install
}
