# Maintainer: Luca Sandrock <luca.sandrock@proton.me>

arch=('x86_64')

pkgname=wayland-boomer-git
pkgver=r41.6c412b1
pkgrel=1

pkgdesc="zoomer application for linux, wayland alternative for tsoding's X11 boomer"
url="https://github.com/lsck0/wayland-boomer"
license=('MIT')

source=("git+https://github.com/lsck0/wayland-boomer.git")
md5sums=('SKIP')

depends=('glfw')
optdepends=(
    'grim: one example of a screenshot tool'
    'wl-clipboard: for clipboard screenshot support'
)
makedepends=('git' 'clang' 'make')
provides=('wayland-boomer')
conflicts=('wayland-boomer')

pkgver() {
  cd "$srcdir/wayland-boomer"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/wayland-boomer"
  make build
}

package() {
  cd "$srcdir/wayland-boomer"

  install -Dm755 wayland-boomer "$pkgdir/usr/bin/wayland-boomer"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 man/wayland-boomer.1 "$pkgdir/usr/share/man/man1/wayland-boomer.1"
}
