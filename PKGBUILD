# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.19.0
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('any')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('14eae0d3a03463557a48f24e8a1c8f33ad7aae9458e0313429ae0af50c63c41bb44a39c2d6709113ca9c9cb0dcd4cf93f473d26afa30c9446fc21f4a242900e5')

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
