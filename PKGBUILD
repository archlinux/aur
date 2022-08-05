# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=flipperbit
pkgver=0.1.2
pkgrel=1
pkgdesc='Corrupted files generator. Random bits flipper.'
url='https://crates.io/crates/flipperbit'
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('c68247be297aab43672896fe64c6b9db755b0d87f4d6e70b3de1b260c2ebd2834775784c91e5ae08697f854c1a01239bea4eadfe94bda851ecf117e84c101d56')

prepare() {
  cd $pkgname-$pkgver 
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 -t "${pkgdir}/usr/bin" \
    target/release/flipperbit
}
