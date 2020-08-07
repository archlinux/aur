# Maintainer: Bert Peters <bert@bertptrs.nl>

pkgname=spotifyd-slim
pkgver=0.2.24
pkgrel=1
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
depends=('alsa-lib' 'libogg' 'gcc-libs')
conflicts=('spotifyd')
makedepends=('cargo')
pkgdesc="A spotify playing daemon, minimal version"
url="https://github.com/Spotifyd/$pkgbase"
source=("spotifyd-$pkgver.tar.gz::https://github.com/Spotifyd/spotifyd/archive/v$pkgver.tar.gz")
sha256sums=('d3763f4647217a8f98ee938b50e141d67a5f3d33e9378894fde2a92c9845ef80')

build() {
  cd "$srcdir/spotifyd-$pkgver"
  cargo build --release --locked --no-default-features --features alsa_backend
}

package() {
  cd "$srcdir/spotifyd-$pkgver"

  install -m755 -Dt "$pkgdir/usr/bin" target/release/spotifyd
  install -m644 -Dt "$pkgdir/usr/lib/systemd/user" contrib/spotifyd.service
}
