# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=scorecard
pkgver=5.2.0 # renovate: datasource=github-tags depName=ossf/scorecard
pkgrel=1
pkgdesc='Security health metrics for Open Source'
arch=(any)
url='https://github.com/ossf/scorecard'
license=(APACHE)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ossf/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('91f957801c2bfb11a6517367035c53461c7900b4aae39c4111f48664fdb59632d09f0b00e815341ed0cbaea78d836bbd7b8ea744726fb3e7a6ccfb1868f2a704')

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
