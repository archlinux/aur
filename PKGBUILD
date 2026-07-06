# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=dnsglobe
pkgver=0.2.0
pkgrel=1
pkgdesc="Global DNS propagation checker TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/514-labs/dnsglobe"
license=('MIT')
depends=(glibc libgcc)
makedepends=(cargo git)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d2beefb160caf7a3296c151f0d1223fd661a260b42306bf7e337af605394a1aa')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
