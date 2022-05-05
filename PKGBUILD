# Maintainer: Y7n05h <Y7n05h(aT)protonmail--d0t--com>
pkgname=matrixone
pkgver=0.4.0
pkgrel=1
pkgdesc='Planet scale, cloud-edge native big data engine crafted for heterogeneous workloads'
arch=('x86_64')
url="https://github.com/matrixorigin/matrixone/"
license=('Apache')
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('66fffaf8abc6829ef9fa5c6f5d861c3a1ce4be9813650721a5d98f284172a961')

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
