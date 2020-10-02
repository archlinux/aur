# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=miniserve
pkgver=0.10.0
pkgrel=1
pkgdesc="Tool to serve files via HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=(MIT)
makedepends=(cargo)
source=(miniserve-$pkgver.tar.gz::https://github.com/svenstaro/miniserve/archive/v${pkgver}.tar.gz)
sha512sums=('af265cf1cf6df945229d391dc2de278d2e075ab4eff10aa0b8d3f3a5bec9831731e96b4cbaab7d431d43d113042e540ed6b197966c372d865413bac44b93e559')

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
