# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-wlgreet-git
pkgver=r4.d4152fdea7
pkgrel=1
pkgdesc="Wayland greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/wlgreet"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(greetd-wlgreet)
provides=(greetd-wlgreet)
makedepends=(rust)

pkgver() {
  cd wlgreet
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
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
