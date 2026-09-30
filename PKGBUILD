# Maintainer: Emiliano Gandini Outeda <emiliano.gandini@protonmail.com>
pkgname=neurafly
pkgver=0.2.0
pkgrel=1
pkgdesc="Real audio in, real neurons firing, real time. Terminal audio visualizer driven by a FlyWire connectome."
arch=('x86_64')
url="https://github.com/emiliano-go/neurafly"
license=('MIT')
depends=('alsa-lib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/emiliano-go/neurafly/archive/refs/tags/v$pkgver.tar.gz")
# ponytail: tag tarball hash not known until the tag exists; pin it when the AUR
# package is first pushed and bump on every release.
sha256sums=('05666549e6f9563c7845d6d2143702665f03a165e1b4dc3217adac19f1302e3f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/neurafly "$pkgdir/usr/bin/neurafly"
  install -Dm644 data/flywire_net.bin "$pkgdir/usr/share/neurafly/flywire_net.bin"
}
