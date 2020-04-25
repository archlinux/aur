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
source=("$pkgname-${pkgver}.tar.gz::https://github.com/zonotope/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('3511102e0d2e50400e6e906f5019b272ccf534cadb06470a210bf7013942a782')

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
