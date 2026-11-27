# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-xwin
pkgver=0.24.2
pkgrel=1
pkgdesc="Cross compile Cargo project to Windows MSVC target with ease"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rust-cross/cargo-xwin"
license=("MIT")
depends=("libgcc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('d2d3c0db254bc1b8f68ebe6d48e6b86d834a27d1019bae2286b0f1c58ab07179a4b42fdb64a90122406daba2122604177fb38f6c24bb1b1bcf3d0f41a478475e')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  # see https://github.com/briansmith/ring/issues/1444#issuecomment-5233109470
  CFLAGS+=' -fno-lto' CXXFLAGS+=' -fno-lto' cargo build --release --frozen
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/cargo-xwin
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
