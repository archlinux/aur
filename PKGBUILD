# Maintainer: Robert Plant <rob@robertplant.io>

pkgname=paswitch-rs
pkgver=0.3.13
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="List and swap to pulse sinks by name"
license=('GPL3')
depends=('pulse-native-provider' 'paswitch')
provides=('paswitch-rs')
url=https://github.com/RobertPlant/paswitch-rs
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('3282fc3907abea6f1132e6d18570236d772fa0f3a66deb84773d404a75f335a977af27203800ff9632d67660102f0d0481ebc0c486d92b919ff745cf75f01967')

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
