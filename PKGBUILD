# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=cargo-whatfeatures
pkgver=0.9.7
pkgrel=1
pkgdesc="A cargo plugin to display features, versions and dependencies of crates."
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/museun/cargo-whatfeatures"
license=("Apache" "MIT")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha512sums=('e70aec7589f4aab79933dd9c34786c54cb6d38300314cd2ebea33121a6e0d1f779b3baa7661e7d62eb6bdf1d43d53e200047a23b5757f7614462dd850df410cc')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked
}

build() {
  cd ${pkgname}-${pkgver}
  # rustls is faster
  cargo build --release --frozen --no-default-features --features "rustls"
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 -t "${pkgdir}/usr/bin" target/release/cargo-whatfeatures
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE-MIT
}
