# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.24.3
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('any')
url=https://github.com/avencera/rustywind
OPTIONS=(!lto)
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('7a5b58e4642aeb862508420e0ec0d2daabd728e2e6a5b83ddf871d142c180ca5d1f5613eef8acd8e4a3d7feefffc05b0f55990dfd5199cee6b9d083bef9f8241')

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
