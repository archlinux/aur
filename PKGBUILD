# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=badgerdb
_name=badger
pkgver=2.0.3
pkgrel=1
pkgdesc="An embeddable, persistent and fast key-value (KV) database written in pure Go"
arch=('x86_64')
url='https://blog.dgraph.io/post/badger'
license=('Apache')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dgraph-io/badger/archive/v${pkgver}.tar.gz")
sha256sums=('de90b7d5ac304ca9477dab7eb2d93c6c37c7732c6462021dc95317d069b7ef1e')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}/badger"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${_name}-${pkgver}/badger"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "${srcdir}/${_name}-bin"
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm755 ${srcdir}/${_name}-bin "${pkgdir}/usr/bin/${_name}"
  go clean -modcache #Remove go libraries
}