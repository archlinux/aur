# Maintainer: rnestler

pkgname=reboot-arch-btw
pkgver=1.2.0
pkgrel=1
pkgdesc='Check if you need to reboot due to an updated kernel'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/rnestler/reboot-arch-btw"
license=('GPL-3.0-only')
makedepends=('rust' 'cargo')
depends=('dbus' 'pacman>6')
replaces=('kernel-updated')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('ee2555351e05a6e0334a79ec64ab923385e6bd44432e90dfdb519b4d78108275')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
