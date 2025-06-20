# Maintainer: Ash <xash at riseup d0t net>
pkgname=iw4x-launcher-git
_pkgname=iw4x-launcher
pkgver=0.10.10.r0.g799a8eb
pkgrel=1
provides=('iw4x-launcher')
pkgdesc='Launcher/Updater for the IW4x MW2 (2009) mod'
url='https://github.com/iw4x/launcher'
license=('GPL3')
arch=('x86_64')
makedepends=('cargo' 'rust' 'pkgconf' 'git')
depends=('openssl' 'perl')
options=('!lto')
source=("$_pkgname::git+https://github.com/iw4x/launcher.git")
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
  install -Dm755 "${CARGO_TARGET_DIR:-target}/release/iw4x-launcher" "$pkgdir/usr/bin/iw4x-launcher"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

