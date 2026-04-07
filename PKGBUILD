# PKGBUILD for Serpent Programming Language
# Maintainer: Göktuğ <goktug@example.com>

pkgname=serpent-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A high-performance systems language with Wayland GUI and Network support"
arch=('x86_64')
url="https://github.com/reenes24/serpent"
license=('MIT')
depends=('wayland' 'curl' 'libxkbcommon')
makedepends=('git' 'wayland-protocols' 'gcc' 'make')
provides=('serpent')
conflicts=('serpent')
source=("serpent::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/serpent"
  # Use git tags or commit count as version
  printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/serpent"
  make
}

package() {
  cd "$srcdir/serpent"
  # Install the main binary
  install -Dm755 serpent "$pkgdir/usr/bin/serpent"
  
  # Install license (if exists)
  # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
