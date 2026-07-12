# Maintainer: hi@devan.gg
pkgname=go-cli-simple
_binname=go-cli-simple
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple generic CLI tool template built with Go, Cobra, and Bubble Tea. This simple provides a foundation for building interactive command-line applications with a clean architecture and modern UI components."
arch=('x86_64' 'aarch64')
url="https://devan.gg/go-cli-simple"
license=('MIT')
depends=()
makedepends=('go')
source=("${_binname}-${pkgver}.tar.gz::https://github.com/imdevan/go-cli-simple/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('REPLACE_WITH_ACTUAL_SHA256')

build() {
  cd "${_binname}-${pkgver}"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-s -w" -o ${_binname} ./cmd/${_binname}
}

package() {
  cd "${_binname}-${pkgver}"
  install -Dm755 ${_binname} "${pkgdir}/usr/bin/${_binname}"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
