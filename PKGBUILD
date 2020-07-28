# Maintainer: Temuri Takalandze <takalandzet@gmail.com>
pkgname=goclockify
pkgver=1.1.0
pkgrel=2
pkgdesc='A terminal based client for Clockify time tracker'
arch=('x86_64')
url='https://github.com/ABGEO/goclockify'
license=('MIT')
makedepends=('go' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('dafdb43daaf6eb7e7c3a321dd732cbe71873ec029c1f58d881ce5058be8ff636')

pkgver() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go run cmd/goclockify/main.go --version
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make build-linux-binary
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/output/$pkgname-$pkgver-linux-amd64 "$pkgdir"/usr/bin/$pkgname
}
