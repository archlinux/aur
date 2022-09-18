# Maintainer: Martin Rodriguez Reboredo <yakoyoku@gmail.com>

pkgname=cxxbridge
pkgver=1.0.75
pkgrel=1
pkgdesc="C++ code generator for integrating cxx crate into a non-Cargo build."
arch=('x86_64')
url="https://cxx.rs"
license=('MIT' 'APACHE')
options=(!lto)
makedepends=('cargo')
source=("https://github.com/dtolnay/cxx/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4d8105e20f6363dd4c22d6f68b59e064af569318117df883ae8d09a42aa23ef8')
b2sums=('30f1540b117e24b21da28c6347fb9e4df0d2ffadb877fbdea5774080a982dc37fc1417342b8239376d2ea732bf401cf8f0a4865831e83787f190e1ed60f16e91')

build() {
  cd "$srcdir/cxx-$pkgver/gen/cmd"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd "$srcdir/cxx-$pkgver"
  install -Dm755 gen/cmd/target/release/${pkgname} -t "${pkgdir}"/usr/bin
  install -Dm644 LICENSE-MIT -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm644 LICENSE-APACHE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
