# Maintainer: Jorge Pizarro-Callejas (jorgicio) <jpizarrocallejas@gmail.com>
pkgname=dnslookup
pkgver=1.5.1
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=('any')
url="https://github.com/ameshkov/dnslookup"
license=('GPL3')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ameshkov/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('6f36f3d47e52829008e965faba8acd0cfc909916')
conflicts=('dnslookup-git' 'dnslookup-bin')

build(){
    cd "${srcdir}/$pkgname-$pkgver"
    mkdir -p "${srcdir}/gopath"
    export GOPATH="${srcdir}/gopath"
    go install -x -v -buildmode=pie -ldflags "-s -w" -trimpath
}

package(){
    mkdir -p $pkgdir/usr/bin
    install $srcdir/gopath/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
