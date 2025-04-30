# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>
# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>

pkgname=gurk-git
pkgver=0.7.1.r309.g4274bc9
pkgrel=2
pkgdesc='CLI client for Signal'
arch=('x86_64')
url='https://github.com/boxdot/gurk-rs'
license=('AGPL3')
makedepends=('git' 'rust' 'cmake' 'protobuf')
optdepends=()
options=('!lto')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|sed 's/-/./g').r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

prepare() {
  cd "${pkgname%-*}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-*}"
  cargo build --release
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 target/release/gurk "$pkgdir/usr/bin/gurk"
}
