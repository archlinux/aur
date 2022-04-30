# Maintainer: Redson <redson@riseup.net>
pkgname=ppfetch-rs-git
_pkgname=ppfetch-rs
pkgver=2.0.0
pkgrel=1
pkgdesc="ppfetch, but written in Rust."
arch=('x86_64')
url="https://github.com/RedsonBr140/ppfetch-rs"
license=('MIT')
makedepends=('rust' 'git')
depends=('wmctrl')
source=("git+https://github.com/RedsonBr140/ppfetch-rs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 target/release/${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
