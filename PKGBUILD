# Maintainer: hi@devan.gg
pkgname=bookmark-plus
_binname=bookmark
pkgver=0.1.0
pkgrel=1
pkgdesc="A bookmark manager for your favorite shell"
arch=('x86_64' 'aarch64')
url="https://devan.gg/bookmark"
license=('MIT')
depends=()
makedepends=('go')
source=("${_binname}-${pkgver}.tar.gz::https://github.com/imdevan/bookmark/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('c12a5e74fae7ef4d0c18c9f4d0516d8b7bf065e94e1a9abee0fbfbe03ae047f7')

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
