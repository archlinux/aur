# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=badger
pkgver=2.0.3
pkgrel=1
pkgdesc="BadgerDB is an embeddable, persistent and fast key-value (KV) database written in pure Go"
arch=('x86_64')
url='https://blog.dgraph.io/post/badger'
license=('Apache-2.0')
makedepends=('go')
source=("https://github.com/dgraph-io/badger/archive/v2.0.3.tar.gz")
md5sums=('c47044da4d90164195df5596b42b359c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/badger"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/badger"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "${srcdir}/${pkgname}-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${srcdir}/${pkgname}-bin "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  go clean -modcache #Remove go libraries
}