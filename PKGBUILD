# Maintainer: mst-mkt <mail@keito.dev>
pkgname=moocs-collect-cli
pkgver=1.0.0
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
sha256sums=('52373a4ee394599f80304e0dc03dc15efb6c45b86584270b17c093749e960c20')

build() {
  cd "$srcdir/moocs-collect-cli-v${pkgver}/collect-cli"
  cargo build --release --locked
}

package() {
  cd "$srcdir/moocs-collect-cli-v${pkgver}"
  install -Dm755 target/release/collect-cli "$pkgdir/usr/bin/collect-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
