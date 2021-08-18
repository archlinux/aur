# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=systemd-autoreload
pkgver=0.1.0
pkgrel=2
pkgdesc="Automatically reload systemd --user unit files"
url="https://git.sr.ht/~whynothugo/systemd-autoreload"
license=("ISC")
arch=("x86_64" "aarch64")
makedepends=("git" "rust")
depends=("systemd")
source=("git+https://git.sr.ht/~whynothugo/systemd-autoreload")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 target/release/systemd-autoreload "$pkgdir"/usr/lib/systemd-autoreload
  install -Dm644 systemd-autoreload.service "$pkgdir"/usr/lib/systemd/user/systemd-autoreload.service
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
