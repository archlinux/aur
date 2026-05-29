# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="diskonaut-ng"
pkgname="${_pkgname}-git"
pkgver=r231.g01aa4d7
pkgrel=1
pkgdesc="Interactive terminal disk-space navigator (diskonaut fork)"
arch=("x86_64")
url="https://github.com/Gigas002/diskonaut-ng"
license=('MIT')
depends=(gcc-libs glibc)
makedepends=(git cargo)
optdepends=()
provides=(diskonaut)
conflicts=(diskonaut)
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/diskonaut"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
