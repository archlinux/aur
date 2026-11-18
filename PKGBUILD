# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>
     
pkgname=containerssh
_pkgname=ContainerSSH
pkgver=0.6.1
pkgrel=1
pkgdesc='Launch containers on demand with SSH'
arch=('x86_64' 'aarch64')
url="https://containerssh.io"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver::https://github.com/$_pkgname/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2d8bdd18ad52f876079579e056ee3dbfba38502972f4d6bcfaddb8094d74b06b3c8000fff899aa93a1957343a0d2ee2eea396c57ab86958c911f49d6f39045d5')
     
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

