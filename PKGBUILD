# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=badger
pkgver=4.9.1
pkgrel=1
pkgdesc="An embeddable, persistent and fast key-value (KV) database written in pure Go"
arch=('x86_64')
url='https://docs.hypermode.com/badger'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
replaces=('badgerdb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dgraph-io/badger/archive/v${pkgver}.tar.gz")
sha256sums=('6e34fae32e4fe797de015f16a21cfa7ecfe126358b95f1790d0517b8116e1750')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/badger"
  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/badger"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/badger"
  install -Dm755 build/badger "${pkgdir}/usr/bin/badger"
}
