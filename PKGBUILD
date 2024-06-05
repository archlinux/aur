# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.22.0
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('any')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('d175712f33dfdab196516e3f53c314410bc0c22892b932699d894f92f5fae0a7a0fd557453cc3f3e1cb64ac6a9430189d49e1bc8417df4264c1bee572fcb9d4d')

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
