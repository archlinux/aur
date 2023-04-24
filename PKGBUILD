# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.16.0
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('any')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('3a048e0d7c759115552e12e8caa411b89aa758150db950896e03d36317953292ff0fec82e46a765e0cf52eb4a659f4d4e13aca55973ac72116d485d46121b858')

prepare() {
  cd $pkgname-$pkgver
  case $CARCH in
  	"pentium4")
		cargo fetch --locked --target "i686-unknown-linux-gnu"
		;;
	*)
  		cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
		;;
  esac
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
