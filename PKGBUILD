# Maintainer: teraflops <cprieto.ortiz@gmail.com>
pkgname=chameleos-git
pkgver=r59.8026142
pkgrel=1
pkgdesc="Wayland screen annotation tool for niri and Hyprland (includes chamel helper)"
arch=('x86_64')
url="https://github.com/Treeniks/chameleos"
license=('custom')
depends=('wayland' 'glibc')
makedepends=('git' 'cargo' 'rust')
source=("git+https://github.com/Treeniks/chameleos.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/chameleos"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/chameleos"

  cargo build --release --locked --workspace
}


package() {
  cd "$srcdir/chameleos"

  install -Dm755 "target/release/chameleos" "$pkgdir/usr/bin/chameleos"
  install -Dm755 "target/release/chamel"     "$pkgdir/usr/bin/chamel"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

