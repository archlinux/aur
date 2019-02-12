# Contributor: Ian Beringer <ian@ianberinger.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf
pkgver=10
pkgrel=1
license=('MIT')
pkgdesc="A terminal file manager inspred by ranger written in Go"
depends=("glibc")
makedepends=('dep' 'git' 'go')
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/gokcehan/lf"
source=("$pkgname-r$pkgver.tar.gz::https://github.com/gokcehan/$pkgname/archive/r$pkgver.tar.gz")
sha256sums=('57ebc53b6f463fa56550f32676bcefb5f242ed27a4a79a51ab76cc1af7528605')
_srcname=${pkgname}-r$pkgver

build() {
  export GOPATH=${srcdir}
  mkdir -p ${GOPATH}/src
  rm -rf ${GOPATH}/src/${_srcname} 
  mv ${_srcname} ${GOPATH}/src
  cd ${GOPATH}/src/${_srcname}
  dep ensure -v
  go build
}

package() {
  cd ${GOPATH}/src/${_srcname}
  install -Dm755 lf-r$pkgver "${pkgdir}"/usr/bin/lf
  install -Dm644 ./LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ./README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md
}
