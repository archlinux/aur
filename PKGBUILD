# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-xwin
pkgver=0.21.5
pkgrel=1
pkgdesc="Cross compile Cargo project to Windows MSVC target with ease"
arch=("x86_64" "i686" "armv7h" "aarch64")
url="https://github.com/rust-cross/cargo-xwin"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('09e8c3abbf8a97998cb2e2cedff0aba4eac04f2a06c189b283d7d0f28315a207c6432f775e4b1d2362798e990c78228456b666f55d91df78c410bd5443f8107b')
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
