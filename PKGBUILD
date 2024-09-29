# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>
     
pkgname=containerssh
_pkgname=ContainerSSH
pkgver=0.5.1
pkgrel=1
pkgdesc='Launch containers on demand with SSH'
arch=('x86_64' 'aarch64')
url="https://containerssh.io"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver::https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c72fc9793da54204e68958bfd24ae3328ca4f5560fbaf16f4f115be89be59ac8860b75ff45359849d9ffc5579514d301853252497e4e9bb400e747e4e184d24b')
     
prepare(){
  cd "$_pkgname-$pkgver"
  mkdir -p build/
}
   
build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}
     
check() {
  cd "$_pkgname-$pkgver"
  go test ./...
}
     
package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

