# Maintainer: mst-mkt <mail@keito.dev>
pkgname=moocs-collect-cli-git
pkgver=0.3.1.11.g2407a19
pkgrel=1
pkgdesc="CLI tool to download lecture slides from INIAD MOOCs (latest git version)"
arch=('x86_64')
url="https://github.com/yu7400ki/moocs-collect"
license=('MIT')
depends=('gcc-libs' 'glibc' 'dbus' 'openssl')
makedepends=('git' 'rust' 'cargo')
provides=('moocs-collect-cli' 'moocs-collect-cli-git')
conflicts=('moocs-collect-cli' 'moocs-collect-cli-bin')
source=("git+https://github.com/yu7400ki/moocs-collect.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/moocs-collect"
  git describe --tags --match "cli-v*" --long | sed -E 's/^cli-v//; s/-/./g'
}

build() {
  cd "$srcdir/moocs-collect/collect-cli"
  cargo build --release --locked
}

package() {
  cd "$srcdir/moocs-collect"
  install -Dm755 target/release/collect-cli "$pkgdir/usr/bin/collect-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
