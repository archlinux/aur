# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=asciigraph
pkgver=0.4.1
pkgrel=1
pkgdesc="Go package to make lightweight ASCII line graph ╭┈╯ in command line apps with no other dependencies"
arch=('x86_64')
url='https://github.com/guptarohit/asciigraph'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/guptarohit/asciigraph/archive/v0.4.1.tar.gz")
md5sums=('6efaf8b04f7f55e4863ce3127aa2308c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/asciigraph"
  go build -v -o "${srcdir}/asciigraph-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../asciigraph-bin "${pkgdir}/usr/bin/asciigraph"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/asciigraph/LICENSE"
  go clean -modcache #Remove go libraries
}