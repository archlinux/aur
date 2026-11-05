# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=what-the-port
pkgver=0.5.7
pkgrel=1
pkgdesc="Quickly lookup what a port is used for."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/cyqsimon/what-the-port"
license=("AGPL-3.0-or-later")
depends=("libgcc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('83f5e9b2b29a0508c1e6c7d4e174d3ca9d87ffcf030cd944131482219cd3e490dd79b18a2d8fe4f06f725d6eb84179f1e16e9b7cfd63cba3cd78cca5fc331407')

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
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/wtp
}
