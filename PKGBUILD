# Maintainer: Gigas002 <gigas002@pm.me>

_pkgname="carboxyl"
pkgname="${_pkgname}-git"
pkgver=r297.g35a3342
pkgrel=1
pkgdesc="Terminal browser built on Servo — community fork of Carbonyl"
arch=('x86_64')
url="https://github.com/carboxyl-rs/$_pkgname"
license=('BSD-3-Clause')
makedepends=(git cargo pkg-config cmake)
depends=(gcc-libs fontconfig)
provides=(carboxyl)
conflicts=(carboxyl)
options=('!strip' '!lto')
source=("${_pkgname}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/build"
  cargo build --all-features --release
}

package() {
  cd "${_pkgname}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/carboxyl"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
