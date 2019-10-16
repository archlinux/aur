# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opensmtpd-filter-senderscore
_pkgname=filter-senderscore
pkgver=0.1.0
pkgrel=1
pkgdesc='OpenSMTPD filter integration for Sender Score'
arch=(i686 x86_64)
url=https://github.com/poolpOrg/filter-senderscore
license=(ISC)
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('1cb883afb10da5991c174ed00c3af1c7d5f3f33aacfa5f4eb19bd23b1c88737afcdbe41a79bd0712b988889ff1e6586a6f73777c052fc7c3ae3cae85e2cbbbca')

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
  install -D filter-senderscore -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
