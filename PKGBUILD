# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=tiny-irc-client
pkgver=0.8.0
pkgrel=1
pkgdesc='Console IRC client written in Rust'
arch=(i686 x86_64 aarch64)
url=https://github.com/osa1/tiny
license=(MIT)
depends=(libdbus openssl)
makedepends=(cargo)
source=("https://github.com/osa1/tiny/archive/v${pkgver}.tar.gz")
md5sums=('31f81d97f65b261342eb9355a7faca82')

build() {
  cd "${srcdir}/tiny-${pkgver}/tiny"
  cargo build --no-default-features --features=tls-native,desktop-notifications --release
}

check() {
  cd "${srcdir}/tiny-${pkgver}/tiny"
  cargo test --no-default-features --features=tls-native,desktop-notifications --release --locked
}

package() {
  cd "${srcdir}/tiny-${pkgver}"
  install -D target/release/tiny -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/tiny
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/tiny
}
