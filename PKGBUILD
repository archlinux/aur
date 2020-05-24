# Maintainer: Odd-Harald Lillestø Myhren <knarkzel@cock.li>
pkgname=groffdown
pkgver=0.1.0
pkgrel=1
pkgdesc="wrapper for creating documents with markdown using groff as backend, because groff is fast and convenient"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.com/knarkzel/groffdown"
license=('MIT')
makedepends=('rust' 'cargo' 'git')
depends=('gcc-libs')
md5sums=(SKIP)

build() {
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
  cd "../"
  install -Dm755 "target/release/groffdown" "$pkgdir/usr/bin/groffdown"
}
