# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Sam Whited <sam@samwhited.com>

pkgname=stripe-cli
pkgver=1.5.2
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
sha512sums=('a5d7938b8846fffcd6bd2eea0fc710b589b3f81dc5f23990eb1b3c415474528e7a0e7172844064e2a0e88fb40f39d6743230b3405698121e187b2a846edafea2'
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
