#Maintainer: d.r.vanrossum at gmx dot de

pkgname=minidsp-rs
pkgver=0.1.7
pkgrel=1
pkgdesc="Alternative control software for certain MiniDSP products"
arch=(x86_64)
url="https://github.com/mrene/minidsp-rs"
license=('APACHE')
depends=('gcc-libs' 'libusb')
makedepends=('git' 'clang' 'cmake' 'rust')
source=("minidsp.tar.gz"::"https://github.com/mrene/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1fff602f05d4881acce40e240e8572acc1d4294cb3b195282bdb68ece9ebc30d')

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
