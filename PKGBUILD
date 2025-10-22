# Maintainer: Nomadcxx <noovie@gmail.com>
pkgname=syscgo
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal animation library and CLI tool for Go"
arch=('x86_64' 'aarch64')
url="https://github.com/Nomadcxx/sysc-Go"
license=('MIT')
depends=()
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nomadcxx/sysc-Go/archive/v${pkgver}.tar.gz")
sha256sums=('9b396de4c0beb813882902fbddee6972d582a6fd476d91172cd2d93d39153a0a')

build() {
  cd "${srcdir}/sysc-Go-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o syscgo ./cmd/syscgo/
}

package() {
  cd "${srcdir}/sysc-Go-${pkgver}"
  
  # Install binary
  install -Dm755 syscgo "${pkgdir}/usr/bin/syscgo"
  
  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 GUIDE.md "${pkgdir}/usr/share/doc/${pkgname}/GUIDE.md"
}
