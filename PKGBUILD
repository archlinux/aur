# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=ws-tcp-proxy
pkgver=0.1.2
pkgrel=2
pkgdesc="Simple websocket tcp proxy."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/ws-tcp-proxy"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("ws-tcp-proxy")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('87114014dd88f48bcddfb53b61b78fb05ab04a6c451ad571e5130d3c00254473')

build() {
  mkdir -p "${srcdir}/go/src/github.com/zquestz"
  export GOPATH="${srcdir}/go"
  export GOBIN="$GOPATH/bin"

  mv "$pkgname-$pkgver" "$GOPATH/src/github.com/zquestz/ws-tcp-proxy"
  cd "$GOPATH/src/github.com/zquestz/ws-tcp-proxy"

  go build .

  go clean -modcache
}

package() {
  cd "${srcdir}/go/src/github.com/zquestz/ws-tcp-proxy"

  install -Dm 775 "ws-tcp-proxy" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
