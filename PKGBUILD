# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="netman"
pkgname="${_pkgname}-git"
pkgver=r23.g5903dce
pkgrel=1
pkgdesc="TUI applet analogue of network-manager-applet"
arch=("x86_64")
url="https://github.com/Gigas002/netman"
license=('GPL-3.0-only')
depends=(networkmanager dbus)
makedepends=(git cargo)
optdepends=()
provides=(netman)
conflicts=(netman)
source=("${_pkgname}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/netman"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
