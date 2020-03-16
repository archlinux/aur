# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gocity
pkgver=1.0.0
pkgrel=1
pkgdesc="Code City metaphor for visualizing Go source code in 3D"
arch=('x86_64')
url='https://go-city.github.io'
license=('MIT')
provides=('gocity')
makedepends=('go')
source=("gocity-${pkgver}.tar.gz::https://github.com/rodrigo-brito/gocity/archive/v${pkgver}.tar.gz")
md5sums=('7387d4727740f49f374d91aea14d7b43')

build() {
  cd "${srcdir}/gocity-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  cd "${srcdir}/gocity-${pkgver}"
  go build -v -o "../gocity-bin"
}

package() {
  cd "${srcdir}/gocity-${pkgver}"
  install -Dm755 ../gocity-bin "${pkgdir}/usr/bin/gocity"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/gocity/LICENSE"
  go clean -modcache #Remove go libraries
}