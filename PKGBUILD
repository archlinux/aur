# Maintainer: Davide Depau <davide@depau.eu>

pkgname=ttyc
pkgver=0.4
pkgrel=1
pkgdesc='ttyd protocol client'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/Depau/ttyc"
license=('GPL3')
makedepends=('go')
source=("git+https://github.com/Depau/ttyc.git#tag=ttyc-v${pkgver}")
sha256sums=('SKIP')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/ttyc
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
