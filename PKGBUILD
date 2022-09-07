# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.15.1
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('x86_64')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('cc5c343449884f9c38f343895a983e902ae4a9341ae67ccb360d41ba487627610f4aa43ff63244d1a94aab25c3f5df76e87c77d6af1a67853dbf30fce1189164')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
