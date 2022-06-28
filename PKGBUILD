# Maintainer: Jamie Magee <jamie dot magee at gmail dot com>

pkgname=gitsign
pkgver=0.1.1 # renovate: datasource=github-tags depName=sigstore/gitsign
pkgrel=1
pkgdesc='Keyless Git signing using Sigstore'
arch=(any)
url='https://github.com/sigstore/gitsign'
license=(APACHE)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sigstore/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bec13804e87f30a4a5450d4e65631baf8b733eab95d26e27b55fb38c92075bb2f04825fcc1129f2cfcdf82624337e99db7acd2f5abd3df841ee01d1bc9b2cc1f')

build() {
  cd $pkgname-$pkgver
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make build
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
