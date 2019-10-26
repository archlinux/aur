# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opensmtpd-filter-rspamd
_pkgname=filter-rspamd
pkgver=0.1.4
pkgrel=1
pkgdesc='OpenSMTPD filter integration for Rspamd'
arch=(i686 x86_64)
url=https://github.com/poolpOrg/filter-rspamd
license=(ISC)
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('66c7d663ed1934ea7a1cbeb59b27d58ac5cac1a42db42b007f95677e542f6eb673f6f9dd8738dd54f0687fbb963412a00ee606c62b6713b0cc37e182ceaf21d0')

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
