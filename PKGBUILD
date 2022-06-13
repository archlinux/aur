# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=scorecard
pkgver=4.4.0 # renovate: datasource=github-tags depName=ossf/scorecard
pkgrel=1
pkgdesc='Security health metrics for Open Source'
arch=(any)
url='https://github.com/ossf/scorecard'
license=(APACHE)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ossf/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6cc9cc51fbfed4e47e85a9b8d6999f7c8b76c0db72efa8a34cd8a5293a7a91ad2cd0ffa6d840790ad6d7989fe50ae4099070df6e3afd0fc850f4e1c5ad3f65ba')

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
