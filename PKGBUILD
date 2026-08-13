# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="notred"
pkgname="${_pkgname}-git"
pkgver=r51.g6c4e8e8
pkgrel=1
pkgdesc="Freedesktop notification daemon platform (session D-Bus + IPC)"
arch=("x86_64")
url="https://github.com/Gigas002/notred"
license=('GPL-3.0-only')
depends=(dbus)
makedepends=(git cargo)
optdepends=()
provides=(notred notredctl notred-tui)
conflicts=(notred)
options=('!strip' '!lto')
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
  install -Dm0755 -t "$pkgdir/usr/bin/" \
    "target/release/notred" \
    "target/release/notredctl" \
    "target/release/notred-tui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
