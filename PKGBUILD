# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-wlgreet-git
pkgver=0.4
pkgrel=1
pkgdesc="Wayland greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/wlgreet"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(greetd-wlgreet)
provides=(greetd-wlgreet=${pkgver%+*})
makedepends=(rust)

pkgver() {
  git -C wlgreet describe --tags --abbrev=10 | sed 's/-/+/; s/-/./'
}

build() {
  cd wlgreet
  cargo build --release
}

check() {
  cd wlgreet
  cargo test --release
}

package() {
  install -d "$pkgdir"/usr/bin
  install -m755 wlgreet/target/release/wlgreet "$pkgdir"/usr/bin/
}
