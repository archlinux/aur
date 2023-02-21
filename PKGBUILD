# Maintainer: Robert Plant <rob@robertplant.io>

pkgname=paswitch-rs
pkgver=0.3.6
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="List and swap to pulse sinks by name"
license=('GPL3')
depends=('pulseaudio' 'paswitch')
provides=('paswitch-rs')
url=https://github.com/RobertPlant/paswitch-rs
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('f12674b623e69b3a27e9d36948385f12e0cb363a5da6ca71b27406d68b824d1f8aa4ce437760d5e551542f736d8909b26e0e1e0549d1d9304dbbb623357ed6d4')

check() {
  cd $pkgname-$pkgver
  cargo test --release
}

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -D target/release/paswitch-rs -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/paswitch-rs
}
