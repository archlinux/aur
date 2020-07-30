# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=tiny-irc-client
pkgver=0.6.0
pkgrel=1
pkgdesc='Console IRC client written in Rust'
arch=(i686 x86_64 aarch64)
url=https://github.com/osa1/tiny
license=(MIT)
depends=(libdbus)
makedepends=(git rustup)
source=("https://github.com/osa1/tiny/archive/v${pkgver}.tar.gz")
md5sums=('1c1413cf7b8eb70e952938673d27fbe4')

build() {
  cd "${srcdir}/tiny-${pkgver}"
  rustup override set nightly
  cargo build --release --locked
} 

check() {
  cd "${srcdir}/tiny-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/tiny-${pkgver}"
  install -D target/release/tiny -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/tiny
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/tiny
}
