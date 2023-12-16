# Maintainer: Your name <bros at brocode dot sh>

pkgname=podlet
pkgver=0.2.2
pkgrel=1
pkgdesc="Generate podman quadlet (systemd-like) files from a podman command "
arch=('x86_64')
url="https://github.com/k9withabone/podlet"
license=('custom: MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('70834d2143c2c06059cb424f9cc7cff0ef48c77d3a5938c4b97ecf257c3ff4f6')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
