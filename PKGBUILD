# Maintainer: mst-mkt <mail@keito.dev>
pkgname=moocs-collect-cli-git
pkgver=1.0.2.1.g2ed9a33
pkgrel=1
pkgdesc="CLI tool to download lecture slides from INIAD MOOCs (latest git version)"
arch=('x86_64')
url="https://github.com/yu7400ki/moocs-collect"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus' 'openssl-3')
makedepends=('git' 'cargo')
provides=('moocs-collect-cli' 'moocs-collect-cli-git')
conflicts=('moocs-collect-cli' 'moocs-collect-cli-bin')
source=("git+https://github.com/yu7400ki/moocs-collect.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/moocs-collect"
  git describe --tags --match "cli-v*" --long | sed -E 's/^cli-v//; s/-/./g'
}

build() {
  cd "$srcdir/moocs-collect"
  export OPENSSL_INCLUDE_DIR=/usr/include/openssl-3
  export OPENSSL_LIB_DIR=/usr/lib/openssl-3
  cargo build --release --locked -p collect-cli
}

package() {
  cd "$srcdir/moocs-collect"
  install -Dm755 target/release/collect-cli "$pkgdir/usr/bin/collect-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
