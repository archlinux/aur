# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hero
pkgver=0.0.2
pkgrel=5
pkgdesc="A handy, fast and powerful go template engine"
arch=('x86_64')
url='https://shiyanhui.github.io/hero'
license=('Apache')
makedepends=('go-pie')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shiyanhui/hero/archive/v${pkgver}.tar.gz")
sha256sums=('42644339748c40f7c1fcd2f8bd3b4138a6f5607f04107d0ed6fd8461a3281d62')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "${srcdir}/hero-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../hero-bin "${pkgdir}/usr/bin/hero"
  go clean -modcache #Remove go libraries
}