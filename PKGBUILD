# Maintainer: Ash <xash at riseup d0t net>
pkgname=rusty-psn-git
_pkgname=rusty-psn
pkgver=0.5.0.r1.ga227494
pkgrel=1
provides=('rusty-psn')
pkgdesc='A PSN user info fetcher written in Rust.'
url='https://github.com/RainbowCookie32/rusty-psn'
arch=('x86_64')
makedepends=('cargo' 'rust' 'pkgconf' 'git')
depends=('openssl' 'perl')
options=('!lto')
source=("$_pkgname::git+https://github.com/RainbowCookie32/rusty-psn.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "${CARGO_TARGET_DIR:-target}/release/rusty-psn" "$pkgdir/usr/bin/rusty-psn"
}
