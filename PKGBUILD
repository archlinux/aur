# Maintainer: Alexander Thaller <aur+hstdb@alexander.thaller.ws>
pkgname=hstdb
pkgver=2.0.2
pkgrel=1
pkgdesc="Better history management for zsh."
arch=('x86_64')
url="https://github.com/AlexanderThaller/hstdb"
license=('MIT')
depends=('sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AlexanderThaller/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('cece9accfdba385e5d31d9fc8e097324bf38dd4950ba2056f4f68d405bab75910b1ed3ff342a54e74fbc495cab90b27fa71b144c0dc6dfc99737cc9663795f12')

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
