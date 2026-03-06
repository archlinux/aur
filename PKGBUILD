# Maintainer: hi@devan.gg
pkgname=go-cli-template
_binname=go-cli-template
pkgver=0.2.0
pkgrel=1
pkgdesc="A generic CLI tool template built with Go, Cobra, and Bubble Tea. This template provides a foundation for building interactive command-line applications with a clean architecture and modern UI components."
arch=('x86_64' 'aarch64')
url="https://devan.gg/go-cli-template"
license=('MIT')
depends=()
makedepends=('go')
source=("${_binname}-${pkgver}.tar.gz::https://github.com/imdevan/go-cli-template/archive/refs/tags/v0.2.0.tar.gz")
sha256sums=('57c819984cf93a6f536b6570069e906a41cd2c3c82c145bc432f9b77117bda04')

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
