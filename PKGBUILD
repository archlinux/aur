# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=music-theory
pkgver=0.0.4
pkgrel=1
pkgdesc="Go models of Note, Scale, Chord and Key"
arch=('x86_64')
url='https://github.com/go-music-theory/music-theory'
license=('GPL-3.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('7905c967dec9387bae39ef3b7784ea65')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
  go build -v -o "../music-theory-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ../music-theory-bin "${pkgdir}/usr/bin/music-theory"
  install -Dm644 LICENSE* "${pkgdir}/usr/share/licenses/music-theory/LICENSE"
  go clean -modcache #Remove go libraries
}