# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>

pkgname=syncthing-relaysrv-git
_pkgname=syncthing-relaysrv
pkgver=0.12.0.r8.g215ba72
pkgrel=1
pkgdesc="Relay Server for Syncthing"
url="http://syncthing.net/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('glibc')
provides=('syncthing-relaysrv=0.12')
makedepends=('git' 'go' 'godep' 'inetutils' 'sed')
source=(${_pkgname}::git+https://github.com/syncthing/relaysrv.git#branch=master)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  export GOPATH="$(pwd)/Godeps/_workspace:$srcdir"

  #go get -d
  go build -i -v -ldflags -w
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 syncthing-relaysrv "${pkgdir}/usr/bin/syncthing-relaysrv"
}
