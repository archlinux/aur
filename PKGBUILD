# Maintainer: Alexander Thaller <aur.archlinux.org+histdb-rs@alexander.thaller.ws>
pkgname=histdb-rs
pkgver=1.0.0
pkgrel=1
pkgdesc="Better history management for zsh."
arch=('x86_64')
url="https://github.com/AlexanderThaller/histdb-rs"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexanderThaller/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('34ce7ff72382db694187e4f0d6141f524a15c6cbd4ce8e23a5a94d7b5ae66273aacf792cefd367fccacfecd0f85167ab1a05251fadbf56ec696b606e2886d58b')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

 check() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
 }

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
