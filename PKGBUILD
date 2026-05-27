# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-xwin
pkgver=0.22.0
pkgrel=2
pkgdesc="Cross compile Cargo project to Windows MSVC target with ease"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rust-cross/cargo-xwin"
license=("MIT")
depends=("libgcc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('08f1f6f740dbb79ec3a2f4f7fe78e50d343bc141b1691437764e3ed08225d3c4e62602e3e739458aa4660214fd7b8fe26e7e63001c1bbbdd13f4ea7677bf6f9b')
# see https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  cargo build --release --frozen
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 -t "${pkgdir}/usr/bin/" target/release/cargo-xwin
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
