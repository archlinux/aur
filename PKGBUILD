# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="diskonaut-ng"
pkgname="${_pkgname}-git"
pkgver=v0.12.2.r0.g01aa4d7
pkgrel=1
pkgdesc="Diskonaut fork"
arch=("x86_64")
url="https://github.com/Gigas002/diskonaut-ng"
license=('MIT')
depends=()
makedepends=(git cargo scdoc)
optdepends=()
provides=(diskonaut)
conflicts=(diskonaut)
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
