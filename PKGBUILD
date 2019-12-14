# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opensmtpd-filter-senderscore
_pkgname=filter-senderscore
pkgver=0.1.1
pkgrel=1
pkgdesc='OpenSMTPD filter integration for Sender Score'
arch=(i686 x86_64)
url=https://github.com/poolpOrg/filter-senderscore
license=(custom:ISC)
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('dc4b8a97c9a10080f7d19e7b358193e1c6bde857db79be7fadb7851aa433b700966509378dd40e1591111817a09371a3a39955b8d553773acf98385e4fc39986')

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
  install -D filter-senderscore -t "$pkgdir"/usr/lib/smtpd/opensmtpd
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
