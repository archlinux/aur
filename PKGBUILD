# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=simplehttp-git
pkgver=r11.ca3634f
pkgrel=1
pkgdesc="Pretty simple and lightweight http server for serving local files"
arch=('x86_64')
url='https://github.com/snwfdhmp/simplehttp'
license=('Apache-2.0')
provides=('simplehttp')
makedepends=('go' 'git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/simplehttp"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/simplehttp"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  cd "${srcdir}/simplehttp"
  go build -v -o "${srcdir}/simplehttp-bin"
}

package() {
  cd "${srcdir}/simplehttp"
  install -Dm755 "${srcdir}"/simplehttp-bin "${pkgdir}/usr/bin/simplehttp"
  go clean -modcache #Remove go libraries
}