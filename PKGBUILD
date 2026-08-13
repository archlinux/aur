# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="poshanka"
pkgname="${_pkgname}-git"
pkgver=r65.g5701400
pkgrel=1
pkgdesc="Wayland-native popup renderer that subscribes to notred (or similar FDN daemon)"
arch=("x86_64")
url="https://github.com/Gigas002/poshanka"
license=('GPL-3.0-only')
depends=(wayland cairo pango)
makedepends=(git cargo)
optdepends=('notred-git: default notification provider (notredctl CLI) that poshanka subscribes to')
provides=(poshanka)
conflicts=(poshanka)
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
    "target/release/poshanka"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
