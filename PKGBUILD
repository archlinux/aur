# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.21.0
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('any')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('e29372753b92ad0bf10dbaaddaf0a605ac4682266a3ca7d65db90a8f391f0149d8b69c4ebc97104ccfc8c3a9a81db03630a746c475aed8ec4c67a06f9546bcea')

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
