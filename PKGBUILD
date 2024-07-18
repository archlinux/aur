# Maintainer: Ash <xash at riseup d0t net>
pkgname=dmodman-git
_pkgname=dmodman
pkgver=r306.54a0274
pkgrel=1
pkgdesc='TUI downloader & update checker for Nexusmods.com'
arch=('x86_64')
url='https://github.com/dandels/dmodman'
license=('MIT')
provides=('dmodman')
makedepends=('cargo' 'rust' 'pkgconf' 'git')
depends=('openssl' 'xdg-utils')
source=("git+https://github.com/dandels/dmodman.git")
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
  install -Dm755 "target/release/dmodman" "$pkgdir/usr/bin/dmodman"
}
