# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=sttr
pkgver=0.2.28
pkgrel=1
pkgdesc='cli app to perform various operations on string'
license=('MIT')
arch=(i686 x86_64 aarch64)
url="https://github.com/abhimanyu003/sttr"
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/abhimanyu003/sttr/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c0b5d8fac3d126178f7ec197567eb54566f35faa5d6f3f6d3b67c76197a56691')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o sttr
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 sttr "${pkgdir}/usr/bin/sttr"
  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
