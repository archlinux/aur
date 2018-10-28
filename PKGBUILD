# Maintainer: leafly <leafly@tuta.io>
pkgname=reflow-git
pkgver=0.1.1
pkgrel=1
pkgdesc="Route any network connection to proxies with flexible rules"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/net-reflow/reflow"
license=('GPL3')
provides=("reflow")
makedepends=('cargo-nightly' 'git')
conflicts=('reflow')
source=("$pkgname::git+https://github.com/net-reflow/reflow")
sha1sums=('SKIP')

build() {
  cd "$pkgname"
  if command -v rustup > /dev/null 2>&1; then
    rustup run nightly \
      cargo build --release
  else
    cargo build --release
  fi
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/reflow" "$pkgdir/usr/bin/reflow"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
