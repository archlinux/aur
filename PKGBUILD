# Maintainer:  Ben Lamothe <bl at 732 dot one>
pkgname=powalert
pkgver=0.1.0
pkgrel=1
pkgdesc="System battery and power status notifier."
arch=('i686' 'x86_64')
url="https://github.com/zonotope/powalert"
license=('MIT')
makedepends=('cargo')
provides=('powalert')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/zonotope/$pkgname/archive/${pkgver//_/-}.tar.gz")
sha256sums=('3935c3d953730aa01dc79acd8d4dfd4bc036e8a0103407512c0a82ba2831510a')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"

  cargo build --release
}

# check() {
#   cd "$srcdir/$pkgname-${pkgver//_/-}"

#   make -k check
# }

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "systemd/powalert.service" "$pkgdir/usr/lib/systemd/user/powalert.service"
}

# vim:set ts=2 sw=2 et:
