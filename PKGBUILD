# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=prometheus-mosquitto-exporter
_pkgname=mosquitto-exporter
pkgver=0.8.0
pkgrel=1
pkgdesc='a prometheus exporter for the mosquitto mqtt server'
arch=('x86_64')
url="https://github.com/sapcc/$_pkgname"
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('47572232b5943630c3c24a10eac64c0010d68b33d591a39cc8870300c6fad291')

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
  go build -o build .
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
