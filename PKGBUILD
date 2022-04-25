# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rustywind
pkgver=0.15.0
pkgrel=1
pkgdesc='CLI for organizing Tailwind CSS classes'
arch=('x86_64')
url=https://github.com/avencera/rustywind
license=('Apache')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('07bafedb701f7355ed68273fe7127429ed58c6948490b834c0859f165ea75d4045bc468ce5383adbf891e71f071b8222d907c8361fe41ee1ad154bf676160c65')

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

# vim:set ts=2 sw=2 et:
