# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=music-theory
pkgver=0.0.4
pkgrel=2
pkgdesc="Go models of Note, Scale, Chord and Key"
arch=('x86_64')
url='https://github.com/go-music-theory/music-theory'
license=('GPL3')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5ca24367560011c9212143aaf4ab9a1f931b2caa69907397dde0d1902976c4df')

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
  go build -v -o "../music-theory-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../music-theory-bin "${pkgdir}/usr/bin/music-theory"
  go clean -modcache #Remove go libraries
}