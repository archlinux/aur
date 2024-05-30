# Maintainer: Robert Plant <rob@robertplant.io>

pkgname=paswitch-rs
pkgver=0.3.12
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="List and swap to pulse sinks by name"
license=('GPL3')
depends=('pulseaudio' 'paswitch')
provides=('paswitch-rs')
url=https://github.com/RobertPlant/paswitch-rs
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('d94ebced51e4fc02be1011c6f2a9651c36b4e8a6590881f1386a1eb948cbc5ff245e71054a72c6c66d8bbfb5db78ef1a7406cc46eeeb6eb6e8bd622843e461b0')

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
