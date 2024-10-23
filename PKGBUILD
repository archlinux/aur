# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.23.1
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('any')
url=https://github.com/avencera/rustywind
OPTIONS=(!lto)
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('f223d9a328cf4e6908459bc9f43b29cefba22019a3fd41248250950f322c058d345b0a60e93183de570e2b0a8d1ada47154df05c3149de1b95eb9b1ace18b22c')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked --offline
}

check() {
  cd $pkgname-$pkgver
  cargo test --locked --offline
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
}
