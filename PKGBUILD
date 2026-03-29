# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>
     
pkgname=containerssh
_pkgname=ContainerSSH
pkgver=0.6.0
pkgrel=1
pkgdesc='Launch containers on demand with SSH'
arch=('x86_64' 'aarch64')
url="https://containerssh.io"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver::https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c0e7e9b7bfe3bd3f85500ddc0a5b0f86162cfe7ff28ea852b56eb06b8c40b5b58f74ec4eaf4de89d2997d49af52f63f7089114588a1ce4a56a7538ca7460f038')
     
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
     
#check() {
#  cd "$_pkgname-$pkgver"
#  go test ./...
#}
     
package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

