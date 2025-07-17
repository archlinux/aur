# Maintainer: mst-mkt <mail@keito.dev>
pkgname=moocs-collect-cli
pkgver=0.3.2
pkgrel=1
pkgdesc="CLI tool to download lecture slides from INIAD MOOCs (from source)"
arch=('x86_64')
url="https://github.com/yu7400ki/moocs-collect"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus' 'openssl')
makedepends=('rust' 'cargo')
provides=('moocs-collect-cli')
conflicts=('moocs-collect-cli-git' 'moocs-collect-cli-bin')
source=("https://github.com/yu7400ki/moocs-collect/archive/refs/tags/cli-v${pkgver}.tar.gz")
sha256sums=('d411722fdeca53968f7b6afd6eb912ac1ca7c490334d616203967c57e1e5f5f4')

build() {
  cd "$srcdir/moocs-collect-cli-v${pkgver}/collect-cli"
  cargo build --release --locked
}

package() {
  cd "$srcdir/moocs-collect-cli-v${pkgver}"
  install -Dm755 target/release/collect-cli "$pkgdir/usr/bin/collect-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
