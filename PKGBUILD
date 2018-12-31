# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_pkgname=pulldown-cmark
pkgname=pulldown-cmark-git
pkgver=0.2.0.r0.gff442b9
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust (Git version)'
arch=('x86_64')
url=https://github.com/google/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
  cd $_pkgname
  cargo build --release --locked
}

package() {
  cd $_pkgname
  install -Dt "$pkgdir"/usr/bin target/release/$_pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
