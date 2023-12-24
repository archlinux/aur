# Maintainer: Matthew Sexton <matthew@asylumtech.com>
pkgname=tcpterm
pkgver=0.0.2
pkgrel=2
pkgdesc='a packet visualizer in TUI'
arch=('x86_64')
url="https://github.com/sachaos/tcpterm"
license=('GPL')
makedepends=('go' 'libpcap')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sachaos/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c4c0c536ddd12509f1fa2607d84a1e2a002a5a82269ade98a9da4933bc8bd020')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
