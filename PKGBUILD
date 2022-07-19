# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-dlm-git
pkgver=r23.6b0e11c4f4
pkgrel=1
pkgdesc="Dumb Login Manager for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/dlm"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(greetd-dlm)
provides=(greetd-dlm)
makedepends=(git rust)

pkgver() {
  cd dlm
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

build() {
  cd dlm
  cargo build --release
}

check() {
  cd dlm
  cargo test --release
}

package() {
  install -d "$pkgdir"/usr/bin
  install -m755 dlm/target/release/dlm "$pkgdir"/usr/bin/

  install -d "$pkgdir"/usr/lib/systemd/system
  install -m644 dlm/dlm.service "$pkgdir"/usr/lib/systemd/system/
}
