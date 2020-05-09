# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=c2go
pkgver=0.26.1
pkgrel=1
pkgdesc="A tool for transpiling C to Go"
arch=('x86_64')
url='https://github.com/elliotchance/c2go'
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d0032a06be4cce8e1709ad034090bb5d8856c06302b978868f677c4acf356fa7')

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
  go build -v -o "../c2go-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../c2go-bin "${pkgdir}/usr/bin/c2go"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/c2go/LICENSE"
  go clean -modcache #Remove go libraries
}