# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mole
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI app to create SSH tunnels"
arch=('x86_64')
url='https://davrodpin.github.io/mole'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davrodpin/mole/archive/v0.5.0.tar.gz")
md5sums=('4950e6dd0a30e8df5f0bcb26e103ded5')

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
  cd cmd/mole
  go build -v -o "${srcdir}/${pkgname}-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../${pkgname}-bin "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}