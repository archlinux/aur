# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.15.4
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('any')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('d6c151458709f4ebbaa6fb07f76239988e7b5637e89bd3fde6e0057f91a06f80fbfd9f8b6f78d65b3318157f2b1eb81c8c44852baf11e391a14b556cb6daabbe')

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
