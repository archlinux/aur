# Maintainer: r4v3n6101 <raven6107@gmail.com>

_pkgbase=mcl-rs
pkgname=${_pkgbase}-git
pkgver=r20.9ca2098
pkgrel=1
pkgdesc="Minecraft launcher written in Rust."
arch=('any')
url="https://github.com/r4v3n6101/mc-launcher-rs"
license=('GPL')
makedepends=('rust' 'cargo' 'git')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("${pkgname}::git+https://github.com/r4v3n6101/mc-launcher-rs#branch=cli")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  cargo fetch
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 "target/release/mcl-cli" "${pkgdir}/usr/bin/mcl-cli"
}
