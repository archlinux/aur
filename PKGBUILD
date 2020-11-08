# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=miniserve
pkgver=0.10.1
pkgrel=1
pkgdesc="Tool to serve files via HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=(miniserve-$pkgver.tar.gz::https://github.com/svenstaro/miniserve/archive/v${pkgver}.tar.gz)
sha512sums=('db61d1480bbf9e739a85e463fce40928b65256fec6c908cf546d818c222aa37236bfd34abf45eb2a799dee935ae0a9b59dae21daa08049b59d2a896eb5a573ab')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo test --release --locked -- --test-threads=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/miniserve "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
