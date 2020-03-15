# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=panicparse
pkgver=1.3.0
pkgrel=1
pkgdesc="Crash your app in style (Golang)"
arch=('x86_64')
url='https://github.com/maruel/panicparse'
license=('Apache2')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('a4ab1f74f6693eb97d0a4878fc280ce0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -v -o "../panicparse-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../panicparse-bin "${pkgdir}/usr/bin/panicparse"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/panicparse/LICENSE"
  go clean -modcache #Remove go libraries
}