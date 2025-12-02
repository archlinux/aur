# Maintainer: mst-mkt <mail@keito.dev>
pkgname=moocs-collect-cli
pkgver=1.0.1
pkgrel=2
pkgdesc="CLI tool to download lecture slides from INIAD MOOCs (from source)"
arch=('x86_64')
url="https://github.com/yu7400ki/moocs-collect"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus' 'openssl')
makedepends=('rust' 'cargo')
provides=('moocs-collect-cli')
conflicts=('moocs-collect-cli-git' 'moocs-collect-cli-bin')
source=("https://github.com/yu7400ki/moocs-collect/archive/refs/tags/cli-v${pkgver}.tar.gz")
sha256sums=('4f0ccee73aa61c2732462272860ecb3a015983490b2b55eca2818b37fe449ca0')

build() {
  cd "$srcdir/moocs-collect-cli-v${pkgver}"
  cargo build --release --locked -p collect-cli
}

package() {
  cd "$srcdir/moocs-collect-cli-v${pkgver}"
  install -Dm755 target/release/collect-cli "$pkgdir/usr/bin/collect-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
