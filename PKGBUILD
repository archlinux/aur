# Maintainer: Madhur Ahuja <ahuja.madhur@gmail.com>
pkgname=csvlens
pkgver=0.5.0
pkgrel=1
pkgdesc='A command line CSV file viewer. It is like less but made for CSV.'
arch=('x86_64')
url='https://github.com/YS-L/csvlens'
license=('MIT')
makedepends=('cargo')
depends=('glibc' 'gcc-libs')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "license.txt")
sha1sums=('SKIP'
          'SKIP')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm 644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd $pkgname-$pkgver
  install -Dm 755 target/release/csvlens "$pkgdir/usr/bin/csvlens"
  
}
