# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=scorecard
pkgver=5.6.0 # renovate: datasource=github-tags depName=ossf/scorecard
pkgrel=1
pkgdesc='Security health metrics for Open Source'
arch=('x86_64')
url='https://github.com/ossf/scorecard'
license=(APACHE)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ossf/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c0ff21580bf61f72efd6e1b1badaa7b286a169640ba5c471ea16228c60396e5f34b1b8563f63c4fff18bea9571ba1938ae66b56800e4a5f877111461eb55f714')

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
