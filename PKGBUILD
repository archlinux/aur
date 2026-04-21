# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-wlgreet-git
pkgver=0.5.0.r0.ge4a7d1f
pkgrel=1
pkgdesc="Wayland greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/wlgreet"
license=(GPL-3.0-only)
depends=(glibc libgcc)
makedepends=(git rust)
conflicts=(greetd-wlgreet)
provides=(greetd-wlgreet=${pkgver%+*})
source=("git+$url")
sha256sums=('SKIP')


pkgver() {
  git -C wlgreet describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
