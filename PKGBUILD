# Maintainer: mst-mkt <mail@keito.dev>
pkgname=moocs-collect-cli
pkgver=1.0.2
pkgrel=1
pkgdesc="CLI tool to download lecture slides from INIAD MOOCs (from source)"
arch=('x86_64')
url="https://github.com/yu7400ki/moocs-collect"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus' 'openssl-3')
makedepends=('cargo')
provides=('moocs-collect-cli')
conflicts=('moocs-collect-cli-git' 'moocs-collect-cli-bin')
source=("https://github.com/yu7400ki/moocs-collect/archive/refs/tags/cli-v${pkgver}.tar.gz")
sha256sums=('7c6e0bec4b9d9bc7fe3d7d947177ecf3342ecca741c60d469e07e17e1cfdb1e5')

build() {
  cd "$srcdir/moocs-collect-cli-v${pkgver}"
  export OPENSSL_INCLUDE_DIR=/usr/include/openssl-3
  export OPENSSL_LIB_DIR=/usr/lib/openssl-3
  cargo build --release --locked -p collect-cli
}

package() {
  cd "$srcdir/moocs-collect-cli-v${pkgver}"
  install -Dm755 target/release/collect-cli "$pkgdir/usr/bin/collect-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
