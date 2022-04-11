# Maintainer: Y7n05h <Y7n05h(aT)protonmail--d0t--com>
pkgname=matrixone
pkgver=0.3.0
pkgrel=1
pkgdesc='Planet scale, cloud-edge native big data engine crafted for heterogeneous workloads'
arch=('x86_64')
url="https://github.com/matrixorigin/matrixone/"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7da976de74dbaad827aca2c96cb242a373832c57caf2526243cc8d43b3f20d0a')

prepare(){
  cd "$pkgname-$pkgver"
  make config
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build
}


package() {
  cd "$pkgname-$pkgver"
  install -Dm755 mo-server "$pkgdir"/usr/bin/mo-server
}
