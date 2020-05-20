# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hero
pkgver=0.0.2
pkgrel=5
pkgdesc="A handy, fast and powerful go template engine"
arch=('x86_64')
url='https://shiyanhui.github.io/hero'
license=('Apache')
makedepends=('go')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shiyanhui/hero/archive/v${pkgver}.tar.gz")
sha256sums=('42644339748c40f7c1fcd2f8bd3b4138a6f5607f04107d0ed6fd8461a3281d62')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go get -d -v ./...
  go build -o build ./hero/...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 build/hero "${pkgdir}/usr/bin/hero"
}