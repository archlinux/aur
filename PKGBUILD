# Maintainer: Grzegorz Baranski <root@gbaranski.com>
pkgname=safedotenv-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool to ensure that all .env secrets are safe by scanning your code"
arch=('x86_64')
url="https://github.com/gbaranski/safedotenv"
license=('MIT')
makedepends=('git' 'cargo')
source=("$pkgname::git+https://github.com/gbaranski/safedotenv")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run stable \
      cargo build --release
  elif rustc --version | grep -q stable; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}

package() {
	cd "$pkgname"

  install -Dm755 "target/release/safedotenv" "$pkgdir/usr/bin/safedotenv"
}
