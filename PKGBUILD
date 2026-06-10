# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="abar"
pkgname="${_pkgname}-git"
pkgver=r77.gb3bb12d
pkgrel=1
pkgdesc="Minimalistic Wayland-native bar with pango and cairo"
arch=("x86_64")
url="https://github.com/Gigas002/abar"
license=('GPL-3.0-only')
depends=(cairo pango wayland)
makedepends=(git cargo)
optdepends=()
provides=(abar)
conflicts=(abar)
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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/abar"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
