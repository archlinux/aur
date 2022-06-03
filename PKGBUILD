# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=scorecard
pkgver=4.3.1 # renovate: datasource=github-tags depName=ossf/scorecard
pkgrel=1
pkgdesc='Security health metrics for Open Source'
arch=(any)
url='https://github.com/ossf/scorecard'
license=(APACHE)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ossf/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('57cc90eae3b637613fd0bbe032ca0f702b1d4c6e569e41f4bca51e0388fdc54262b816335a4189668f91ace951998a6011e7ef2f7bd935f6050093ca0091e4f9')

build() {
  cd $pkgname-$pkgver
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make build-${pkgname}
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
