# Maintainer: nickl <nick.lanham.nexus+aur@gmail.com>

pkgname=click
pkgdir="pkg-build"
pkgdesc="Click CLI for Kubernetes"
pkgver=0.4.3
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/databricks/click"
license=('apache2')
makedepends=('rust')

source=("https://github.com/databricks/click/archive/v${pkgver}.tar.gz")
sha256sums=('2f7f2cd2c53ef1fefe251ddf5f69fa5d6128c1776800a12461495f3e1af24c8b')

build() {
  cd "$srcdir/click-$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$srcdir/click-$pkgver"
  cargo test --release --locked
}

package() {
  install -Dm 755 "$srcdir/click-$pkgver/target/release/click" "$pkgdir/usr/bin/click"
}
