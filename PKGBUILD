# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=wgcf
pkgver=1.0.6
pkgrel=2
pkgdesc='Generate WireGuard profile from Cloudflare Warp account'
arch=('x86_64')
url="https://github.com/ViRb3/wgcf"
license=('custom')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d3d3123d002c1b5dc5a321d4c122436981254951d1c46565575888a8bade44b3')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "$pkgname-$pkgver"
  export CGO_ENABLED="1"
  go build -o build -trimpath -buildmode=pie -ldflags "-s -w" -modcacherw
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
