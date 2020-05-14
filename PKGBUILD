# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=panicparse
pkgver=1.4.1
pkgrel=1
pkgdesc="Crash your app in style (Golang)"
arch=('x86_64')
url='https://github.com/maruel/panicparse'
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6ee08d35912c570dad33761a55b384afda3d0dbbe45a49fcb213df61d036555c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "../panicparse-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../panicparse-bin "${pkgdir}/usr/bin/panicparse"
  go clean -modcache #Remove go libraries
}