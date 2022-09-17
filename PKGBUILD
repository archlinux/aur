# Maintainer: Davide Depau <davide@depau.eu>

_srcname=ttyc
pkgname=wistty
pkgver=0.4
pkgrel=1
pkgdesc='Set remote terminal parameters for Wi-Se'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/Depau/wi-se-sw"
license=('GPL3')
makedepends=('go')
source=("git+https://github.com/Depau/ttyc.git#tag=wistty-v${pkgver}")
sha256sums=('SKIP')

prepare(){
  cd "$_srcname"
  mkdir -p build/
}

build() {
  cd "$_srcname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/wistty
}

package() {
  cd "$_srcname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
