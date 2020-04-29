# Maintainer:  Ben Lamothe <bl at 732 dot one>
pkgname=powalert
pkgver=0.1.2
pkgrel=1
pkgdesc="System battery and power status notifier."
arch=('i686' 'x86_64')
url="https://github.com/zonotope/powalert"
license=('MIT')
makedepends=('cargo')
provides=('powalert')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/zonotope/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('9fe98904ec59c31ac3bf4b845273947891d04512f24ce6ab8ae39fdd400126b9')

build() {
  cd "$srcdir/$pkgname-${pkgver}"

  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "systemd/powalert.service" "$pkgdir/usr/lib/systemd/user/powalert.service"
}

# vim:set ts=2 sw=2 et:
