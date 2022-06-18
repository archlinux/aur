# Maintainer: Sup3Legacy <constantin {dot} gierczak {dot} galle (at) protonmail [dot] com>

pkgname=gurk-git
pkgver=0.2.5.dev.r166.g0e076c9
pkgrel=1
pkgdesc='CLI client for Signal'
arch=('x86_64')
url='https://github.com/boxdot/gurk-rs'
license=('AGPL3')
makedepends=('git' 'rust')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|sed 's/-/./g').r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname%-*}"
  cargo build --release
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 target/release/gurk "$pkgdir/usr/bin/gurk"
}
