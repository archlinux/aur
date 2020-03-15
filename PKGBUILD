# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=goxygen
pkgver=0.2.1
pkgrel=1
pkgdesc="Generate a modern Web project with Go, Angular/React/Vue, and MongoDB in secondsrocket"
arch=('x86_64')
url='https://github.com/Shpota/goxygen'
license=('Apache2')
depends=('docker' 'docker-compose' 'nodejs' 'npm')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('70f88b6df485aaadbf780d0ce4c5d23e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -v -o "../goxygen-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../goxygen-bin "${pkgdir}/usr/bin/goxygen"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/goxygen/LICENSE"
  go clean -modcache #Remove go libraries
}