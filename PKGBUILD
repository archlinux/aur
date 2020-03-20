# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=c2go
pkgver=0.25.9
pkgrel=3
pkgdesc="A tool for transpiling C to Go"
arch=('x86_64')
url='https://github.com/elliotchance/c2go'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('c1ac9bf2637725238711070b2a7228d1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
  go build -v -o "../c2go-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../c2go-bin "${pkgdir}/usr/bin/c2go"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/c2go/LICENSE"
  go clean -modcache #Remove go libraries
}