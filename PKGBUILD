# Maintainer: Your name <bros at brocode dot sh>

pkgname=podlet
pkgver=0.2.0
pkgrel=1
pkgdesc="Generate podman quadlet (systemd-like) files from a podman command "
arch=('x86_64')
url="https://github.com/k9withabone/podlet"
license=('MPL-2.0')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ceee228b0f967882db20e5209d1070b5d0ed8e8c6e3a59e7299e9e3b17d0d353')

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
