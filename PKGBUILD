#Maintainer: d.r.vanrossum at gmx dot de

pkgname=minidsp-rs
pkgver=0.1.12
pkgrel=1
pkgdesc="Alternative control software for certain MiniDSP products"
arch=(x86_64)
url="https://github.com/mrene/minidsp-rs"
license=('APACHE')
depends=('gcc-libs' 'libusb')
makedepends=('git' 'clang' 'cmake' 'rust')
source=("minidsp_${pkgver}.tar.gz"::"https://github.com/mrene/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
options=('!lto')
sha256sums=('2ab458800db532e3e3d28255ff58e6a6f3a985778970bc07ca172611b775dd18')

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
