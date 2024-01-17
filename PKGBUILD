#Maintainer: d.r.vanrossum at gmx dot de

pkgname=minidsp-rs
pkgver=0.1.9
pkgrel=1
pkgdesc="Alternative control software for certain MiniDSP products"
arch=(x86_64)
url="https://github.com/mrene/minidsp-rs"
license=('APACHE')
depends=('gcc-libs' 'libusb')
makedepends=('git' 'clang' 'cmake' 'rust')
source=("minidsp.tar.gz"::"https://github.com/mrene/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
options=('!lto')
sha256sums=('caf9db7418bf9e7fccaeb7664af56a70dc67eb7eb31073ace34406c71b6d246f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --bin minidsp
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --bin minidsp
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/minidsp -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
