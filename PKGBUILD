# Maintainer: hi@devan.gg
pkgname=timr-cli
_binname=timr
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple cli timer"
arch=('x86_64' 'aarch64')
url="https://devan.gg/timr"
license=('MIT')
depends=()
makedepends=('go')
source=("${_binname}-${pkgver}.tar.gz::https://github.com/imdevan/timr-cli/archive/refs/tags/v${pkgver}.tar.gz")
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
