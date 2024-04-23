# Maintainer: Sadique Azmi sadiquemobaraka5@gmail.com
pkgname=llogin
pkgver=0.1.2.r0.g27d6567
pkgrel=1
pkgdesc="LPU WiFi Manager: A Rust-based CLI tool for managing Lovely Professional University's WiFi connections. Features include account login, stored account listing, and connection verification."
arch=('x86_64')
url="https://github.com/smazmi/LPU-WiFi-Manager"
license=('MIT')
depends=('gcc-libs' 'glibc' 'curl' 'networkmanager')
makedepends=('cargo' 'git')
source=("git+https://github.com/smazmi/LPU-WiFi-Manager.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd "$srcdir/LPU-WiFi-Manager/"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/LPU-WiFi-Manager/llogin"
  cargo build --release
}

package() {
  cd "$srcdir/LPU-WiFi-Manager/llogin"
  install -Dm755 target/release/llogin "$pkgdir/usr/bin/llogin"
  install -Dm644 DOCS.md "$pkgdir/usr/share/doc/$pkgname/DOCS.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
