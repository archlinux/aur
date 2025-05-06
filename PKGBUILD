# Maintainer: Robert Plant <rob@robertplant.io>

pkgname=paswitch-rs
pkgver=0.3.15
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="List and swap to pulse sinks by name"
license=('GPL3')
depends=('pulse-native-provider' 'paswitch')
provides=('paswitch-rs')
url=https://github.com/RobertPlant/paswitch-rs
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('edec2d5a40a09f036bb3e9172e8179d548ec4f92a98b289f7c415872baf3fd4e2efec47557fbe88f34c196245dcd3b851a83fd4a728c1f4ce3b8d23a952f89ff')

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
