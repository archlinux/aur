# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=badgerdb
_name=badger
pkgver=4.0.1
pkgrel=1
pkgdesc="An embeddable, persistent and fast key-value (KV) database written in pure Go"
arch=('x86_64')
url='https://blog.dgraph.io/post/badger'
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dgraph-io/badger/archive/v${pkgver}.tar.gz")
sha256sums=('e99f97ca28f3ac39a0aafefd74ef1448ff9df5daf58aadb1be6521225347c9af')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}/badger"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${_name}-${pkgver}/badger"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/${_name}-${pkgver}/badger"
  install -Dm755 build/badger "${pkgdir}/usr/bin/badger"
}
