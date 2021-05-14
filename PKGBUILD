# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=tiny-irc-client
pkgver=0.9.0
pkgrel=2
pkgdesc='Console IRC client written in Rust'
arch=(i686 x86_64 aarch64)
url=https://github.com/osa1/tiny
license=(MIT)
depends=(libdbus openssl)
makedepends=(cargo)
source=("https://github.com/osa1/tiny/archive/v${pkgver}.tar.gz")
md5sums=('e4a523edfa7735a51eded64eee5689de')

build() {
  cd "${srcdir}/tiny-${pkgver}"
  cargo install --path crates/tiny --no-default-features --features=tls-native,desktop-notifications
}

check() {
  cd "${srcdir}/tiny-${pkgver}"
  cargo test --no-default-features --features=tls-native,desktop-notifications --release
}

package() {
  cd "${srcdir}/tiny-${pkgver}"
  install -D target/release/tiny -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/tiny
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/tiny
}
