# Maintainer: Ash <xash at riseup d0t net>
pkgname=alterware-launcher-git
_pkgname=alterware-launcher
pkgver=r383.812d880
pkgrel=2
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm755 "${CARGO_TARGET_DIR:-target}/release/alterware-launcher" "$pkgdir/usr/bin/alterware-launcher"
}

