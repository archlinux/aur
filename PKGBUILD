# Maintainer: Yuki Okushi <huyuumi.dev@gmail.com>
pkgname=pinact
pkgver=3.4.2
pkgrel=1
pkgdesc="CLI to pin GitHub Actions and Reusable Workflows to full hashes"
arch=('x86_64' 'aarch64')
url="https://github.com/suzuki-shunsuke/pinact"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2b47c1d6fee9b41a58e21d1d9452fae7434134637472e80e499490079922f389')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -X main.version=${pkgver}" -o ${pkgname} ./cmd/pinact
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}