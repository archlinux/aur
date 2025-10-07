# Maintainer: Ash <xash at riseup d0t net>
pkgname=rusty-psn-cli-git
_pkgname=rusty-psn
pkgver=0.5.9.r6.gec3c959
pkgrel=1
provides=('rusty-psn')
conflicts=('rusty-psn-bin')
replaces=('rusty-psn-bin')
pkgdesc='A tool for downloading PS3 and PS4 game updates (CLI-only version)'
url='https://github.com/RainbowCookie32/rusty-psn'
license=('MIT')
arch=('x86_64')
makedepends=('cargo' 'rust' 'pkgconf' 'git')
depends=('openssl')
options=('!lto')
source=("$_pkgname::git+https://github.com/RainbowCookie32/rusty-psn.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release --no-default-features --features "cli"
}

package() {
  cd "$_pkgname"
  install -Dm755 "${CARGO_TARGET_DIR:-target}/release/rusty-psn" "$pkgdir/usr/bin/rusty-psn"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
