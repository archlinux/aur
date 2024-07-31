# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=ngtop
pkgver=0.4.0
pkgrel=1
pkgdesc='Request analytics from the nginx access logs'
url='https://github.com/facundoolano/ngtop'
license=('GPL-3.0')
arch=('x86_64')
makedepends=('go')
source=("https://github.com/facundoolano/ngtop/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ed0ff5c58b7fe2e9d5189f6343fb1188dce283b25942bcedc9c419345d211493')
b2sums=('3ba001361e22a2054c58720b935864824cb9dfb524bc3fcb65dba9af6972e6239da827ad85194104dd5d0f59b8d9328779d6ed701706c9b82adaefffd5c41204')

prepare() {
  cd "ngtop-$pkgver"

  mkdir -p build
}

build() {
  cd "ngtop-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build .
}

package() {
  cd "ngtop-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" build/ngtop
}
