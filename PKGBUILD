# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
pkgname=cfetch-agent
pkgver=0.6.0
pkgrel=1
pkgdesc="A second brain for coding agents: privilege-ring memory, hook injection, retrieval, and a code index in one binary"
arch=('x86_64' 'aarch64')
url="https://github.com/julian-corbet/cfetch"
license=('LicenseRef-FSL-1.1-ALv2')
provides=('cfetch')
conflicts=('cfetch')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/julian-corbet/cfetch.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
