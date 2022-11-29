# Maintainer: Robert Plant <rob at robertplant dot io>

pkgname=jiggle
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="jiggle - A Tiny Program to Jiggle Your Mouse"
license=('GPL3')
depends=('xdotool')
provides=('jiggle')
url=https://github.com/RobertPlant/wfh-jiggle
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('611fa1003af18a1c2dd94d4c6eb0c234b089948e2300ce4205ec0f60149c92a1f824cb99465504f3cc104e79bd31b5c2ff27c83aafe3a66905990c27cf5ce840')

check() {
  cd $pkgname-$pkgver
  cargo test --release
}

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -D target/release/jiggle -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/jiggle
}
