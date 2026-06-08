# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="trayd"
pkgname="${_pkgname}-git"
pkgver=r44.g40f79ae
pkgrel=1
pkgdesc="Minimalistic Wayland system tray daemon with IPC socket"
arch=("x86_64")
url="https://github.com/Gigas002/trayd"
license=('GPL-3.0-only')
depends=(dbus)
makedepends=(git cargo)
optdepends=()
provides=(trayd)
conflicts=(trayd)
source=("${_pkgname}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  cargo build --all-features --release
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" \
    "target/release/trayd" \
    "target/release/trayctl" \
    "target/release/tray-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
