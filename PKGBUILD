# Maintainer: Wesley Moore <wes@wezm.net>

_pkgname="bb-rs"
pkgname="${_pkgname}-git"
pkgver=r8.f759b54
pkgrel=1
pkgdesc='Simple process viewer in Rust'
arch=('x86_64')
url="https://github.com/epilys/bb"
license=('GPL3')
depends=()
conflicts=('bb-rs' 'bb')
makedepends=('rust' 'cargo')
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"

  install -Dm755 "target/release/bb" "$pkgdir/usr/bin/bb"
}
