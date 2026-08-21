# Maintainer: tlipinski <aur at t3xh dot nl>

pkgname=rura-git
_pkgname=${pkgname%-*}
pkgver=v1.13.0.r0.gfd79ef3
pkgrel=1
pkgdesc="Interactive TUI pipeline editor built for rapid iteration."
arch=('x86_64')
url="https://github.com/tlipinski/rura"
license=('MIT')
makedepends=('cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
options=(!debug)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
