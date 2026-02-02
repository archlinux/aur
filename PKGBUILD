# Maintainer: Your name <bros at brocode dot sh>

pkgname=podlet
pkgver=0.3.1
pkgrel=1
pkgdesc="Generate podman quadlet (systemd-like) files from a podman command "
arch=('x86_64')
url="https://github.com/containers/podlet"
license=('custom: MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9dd2ce4a618563f8cb607106eb8082744b228575627bcc5e144c9f076e4be691')

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
