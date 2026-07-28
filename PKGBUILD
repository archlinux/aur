# Maintainer: galister <galister at librevr dot org>

_pkgname=obah
pkgname=$_pkgname-git
pkgver=0.1.0.r0.22425c8
pkgrel=1
pkgdesc="OpenVR bindings TUI for xrizer, VapoR, OpenComposite"
url="https://github.com/galister/obah"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'cargo')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/galister/obah.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
