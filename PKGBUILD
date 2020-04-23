# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=grapes
pkgver=0.3.1
pkgrel=1
pkgdesc="Easy way to distribute commands over SSH"
arch=('x86_64')
url='https://github.com/yaronsumel/grapes'
license=('MIT')
makedepends=('go-pie')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('856e1c801df46a78bc089a089192aacce4cc8755dd83bcb95da896bdc205ac74')

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
  go build -mod=mod -v -o "${srcdir}/${pkgname}-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../${pkgname}-bin "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}