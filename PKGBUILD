# Maintainer: Temuri Takalandze <takalandzet@gmail.com>
pkgname=goclockify
pkgver=1.2.0
pkgrel=1
pkgdesc='A terminal based client for Clockify time tracker'
arch=('x86_64')
url='https://github.com/ABGEO/goclockify'
license=('MIT')
makedepends=('go' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('69f0bf1fbc0a005a9a7579ef47ad24e39df6c326c71f3439f1be7695ba9a463c')

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
