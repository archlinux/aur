# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=what-the-port
pkgver=0.5.0
pkgrel=1
pkgdesc="Quickly lookup what a port is used for."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/cyqsimon/what-the-port"
license=("AGPL-3.0-or-later")
depends=("gcc-libs" "openssl")
makedepends=("cargo" "openssl")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('71e0b45ae419742a355d12d0005c5fa68a9afbae04ba9b84a283853976a477ac836d42e1e258cb64becd2f49c4af24b1bc23c9b76e3b2d54f4ce8dfd5f0e737e')

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
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/wtp
}
