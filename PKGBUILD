# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=badgerdb
_name=badger
pkgver=4.7.0
pkgrel=1
pkgdesc="An embeddable, persistent and fast key-value (KV) database written in pure Go"
arch=('x86_64')
url='https://docs.hypermode.com/badger'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${_name}-${pkgver}.tar.gz::https://github.com/hypermodeinc/badger/archive/v${pkgver}.tar.gz")
sha256sums=('6888638b81168d9c690856f8607ed83a5607c100fdb20ac6b144ed306130ff09')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}/badger"
  mkdir -p build
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
