# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hero
pkgver=0.0.2
pkgrel=2
pkgdesc="A handy, fast and powerful go template engine"
arch=('x86_64')
url='https://shiyanhui.github.io/hero'
license=('Apache2')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shiyanhui/hero/archive/v${pkgver}.tar.gz")
md5sums=('de40e3da62f50e0948194823e4910fb1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
  cd "${srcdir}/${pkgname}-${pkgver}/hero"
  go build -v -o "${srcdir}/hero-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../hero-bin "${pkgdir}/usr/bin/hero"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/hero/LICENSE"
  go clean -modcache #Remove go libraries
}