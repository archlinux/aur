# Maintainer: Ash <xash at riseup d0t net>
pkgname=alterware-launcher-git
_pkgname=alterware-launcher
pkgver=0.7.0.r12.g2a7ceee
pkgrel=3
provides=('alterware-launcher')
pkgdesc='AlterWare.dev updater & launcher, written in Rust.'
url='https://github.com/mxve/alterware-launcher'
arch=('x86_64')
makedepends=('cargo' 'rust' 'pkgconf' 'git')
depends=('openssl' 'perl')
options=('!lto')
source=("$_pkgname::git+https://github.com/mxve/alterware-launcher.git")
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
  install -Dm755 "${CARGO_TARGET_DIR:-target}/release/alterware-launcher" "$pkgdir/usr/bin/alterware-launcher"
}

