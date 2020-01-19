# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=bb-rs
pkgver=0.4.0
pkgrel=1
pkgdesc='Simple process viewer in Rust'
arch=(x86_64 aarch64)
url=https://nessuent.xyz/bb.html
license=(GPL3)
depends=(gcc-libs)
makedepends=(rust)
source=($pkgname-$pkgver.tar.gz::https://github.com/epilys/bb/archive/$pkgver.tar.gz)
sha512sums=('f189fd77603d8e4335a41acc27bf017ab12f0ba024c14bf930b8ba1744f0bd070635ba9c09fd39b7b1f37f0e9d38f074a782bf38ff6d05da468ff6df735b65ce')

prepare() {
  # Fixes build on AArch64
  [ $CARCH = aarch64 ] && sed 's#i8#u8#g' -i bb-$pkgver/src/ui.rs
}

build() {
  cd bb-$pkgver
  cargo build --release
}

check() {
  cd bb-$pkgver
  cargo test --release
}

package() {
  cd bb-$pkgver
  install -D target/release/bb -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/bb
}
