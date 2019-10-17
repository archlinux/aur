# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=opensmtpd-filter-senderscore-git
_pkgname=filter-senderscore
pkgver=0.1.0+r3+g824cc03
pkgrel=3
pkgdesc='OpenSMTPD filter integration for Sender Score (git)'
arch=(i686 x86_64)
url=https://github.com/poolpOrg/filter-senderscore
license=(ISC)
depends=(glibc)
makedepends=(git go)
source=(git+$url)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd $_pkgname
  go build \
    -buildmode pie \
    -ldflags "-extldflags $LDFLAGS" \
    -trimpath \
    $_pkgname.go
}

package() {
  cd $_pkgname
  install -D filter-senderscore -t "$pkgdir"/usr/lib/smtpd/opensmtpd
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/${pkgname/-git/}
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname/-git/}
}
