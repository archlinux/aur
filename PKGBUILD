# Maintainer: Josh Ellithorpe <quest at mac dot com>

pkgname=ws-tcp-proxy
pkgver=0.1.2
pkgrel=1
pkgdesc="Simple websocket tcp proxy."
arch=('i686' 'x86_64')
url="http://github.com/zquestz/ws-tcp-proxy"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("ws-tcp-proxy")
source=("https://github.com/zquestz/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f5d37b8659d3df76b0a3906eb9f0e3968771f68b1b3558310a2ef057745a3b70')

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
