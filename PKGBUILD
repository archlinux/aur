# Maintainer: Your name <bros at brocode dot sh>

pkgname=podlet
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate podman quadlet (systemd-like) files from a podman command "
arch=('x86_64')
url="https://github.com/containers/podlet"
license=('custom: MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b91398ef75566a2a646e9845d1211854e7275fce727d4b976e7d8a3c4430ae52')

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
