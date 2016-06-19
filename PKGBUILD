#Maintainer: M0Rf30

_pkgname=openbazaar-go
pkgname=${_pkgname}-git
pkgver=131.c4149e4
pkgrel=1
pkgdesc="OpenBazaar Server Daemon in Go"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=('zeromq')
makedepends=('go')
source=(${_pkgname}.service)

options=('!strip')

package(){
  cd $srcdir
	if [ ! -d ${_pkgname} ]; then
	  mkdir ${_pkgname}
	fi
  cd ${_pkgname}
  export GOPATH=`pwd`
  go get github.com/OpenBazaar/openbazaar-go

msg2 "Install binary file"
  install -Dm755 bin/${_pkgname} $pkgdir/usr/bin/${_pkgname}

msg2 "Install systemd service"
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/${_pkgname}.service

}

#pkgver() {
#  cd ${_pkgname}
#  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)

md5sums=('7c2dd73344fc42c2351e3404b515e32e')
