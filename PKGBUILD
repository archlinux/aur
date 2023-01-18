# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=conserve
pkgver=23.1.0
pkgrel=1
pkgdesc="Robust portable backup tool written in Rust"
arch=('x86_64')
url="https://github.com/sourcefrog/conserve"
license=('GPL2')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2fdaf78457c8996caa78da96fa7f105f12ffcb3b2e5ee0353955d1b3d706100bf6170faeb0bab64a172da3873370eda64b8db6a516a730fc8c3eab47cb371cd5')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
