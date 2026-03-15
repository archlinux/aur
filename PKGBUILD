# Maintainer: csmantle <aur at csmantle dot top>

_pkgname=ironclaw
pkgname="$_pkgname"-git
pkgver=0.16.1.r52.gab0a2e0
pkgrel=2
pkgdesc='OpenClaw-inspired Rust personal AI assistant focused on privacy and security'
arch=('x86_64' 'aarch64')
url='https://github.com/nearai/ironclaw'
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc' 'postgresql-libs')
makedepends=('cargo' 'git' 'rust')
optdepends=(
  'postgresql: local PostgreSQL database'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/nearai/ironclaw.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir"/ironclaw
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/ironclaw
  cargo build --release --locked
}

check() {
  cd "$srcdir"/ironclaw
  cargo test --locked
}

package() {
  cd "$srcdir"/ironclaw

  install -vDm755 target/release/ironclaw "$pkgdir"/usr/bin/ironclaw
  install -vDm644 README.md "$pkgdir"/usr/share/doc/"$_pkgname"/README.md
  install -vDm644 LICENSE-APACHE "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE-APACHE
  install -vDm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/"$_pkgname"/LICENSE-MIT
}
