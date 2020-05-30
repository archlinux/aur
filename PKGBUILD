# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=stripe-cli
pkgver=1.4.1
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
sha512sums=('136592dc392bdcfc644974d17e54782ef157a1b6a305ba2248402ab595cfc2630657eb007df6a47eb3a48bfb9613b95190cf705de2cecf511c22bbc601b74c66'
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
