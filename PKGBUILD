# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=stripe-cli
pkgver=1.3.10
pkgrel=1
pkgdesc='CLI for Stripe'
arch=(x86_64)
url=https://stripe.com/docs/stripe-cli
license=(Apache)
depends=(glibc)
makedepends=(go)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/stripe/stripe-cli/archive/v$pkgver.tar.gz
  reproducible-image-flags.patch
)
sha512sums=('6d856ce6c80635bc7ae6e2e99e8ad6f08b6383b18bd2067decd1eaa803a6b97f15e67c1735d3fe65c583c93230402ac56cd224293b287cf964de06415c36386d'
            '4f5ff8662f5e4bce1ded88a055e652c41dd6492cda5aee74795752abf0e97cc269ec1fef84df2247f62809f0c8cc1a88dd12104e07090cc224bbc5ad46b33f37')

prepare() {
  cd $pkgname-$pkgver

  # Add reproducible image flags
  patch -Np0 < ../reproducible-image-flags.patch

  make setup
}

build() {
  cd $pkgname-$pkgver
  make build
}

check() {
  cd $pkgname-$pkgver
  make test
}

package() {
  cd $pkgname-$pkgver
  install -D stripe -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  cp -a docs "$pkgdir"/usr/share/doc/$pkgname
}
