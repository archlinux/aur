# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=scorecard
pkgver=5.4.0 # renovate: datasource=github-tags depName=ossf/scorecard
pkgrel=1
pkgdesc='Security health metrics for Open Source'
arch=('x86_64')
url='https://github.com/ossf/scorecard'
license=(APACHE)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ossf/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('43069be51e61b15490d4bd49ddfff149b1729d4431f416bbf9e93ce178c0f5f07a4d7cc0bfda1744983b453f81da0246befe1f6c2b7e2db1478efe110456fb2d')

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
