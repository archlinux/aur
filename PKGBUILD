# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

_pkgname=pulldown-cmark
pkgname=pulldown-cmark-git
pkgver=0.1.0.r39.gff442b9
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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 target/release/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}

# vim:set ts=2 sw=2 et:
