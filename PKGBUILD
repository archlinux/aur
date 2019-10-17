# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opensmtpd-filter-rspamd
_pkgname=filter-rspamd
pkgver=0.1.3
pkgrel=2
pkgdesc='OpenSMTPD filter integration for Rspamd'
arch=(i686 x86_64)
url=https://github.com/poolpOrg/filter-rspamd
license=(ISC)
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('bc1cf59d37539a2f1bc092a9416ea5db511d19a0d72f9da00541afeba36d6d235ca98ce0cd859a09cb1d9137b929a6863596b89f5906fedf443061cf8110584f')

build() {
  cd $_pkgname-$pkgver
  go build \
    -buildmode pie \
    -ldflags "-extldflags $LDFLAGS" \
    -trimpath \
    $_pkgname.go
}

package() {
  cd $_pkgname-$pkgver
  install -D filter-rspamd -t "$pkgdir"/usr/lib/smtpd/opensmtpd
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
