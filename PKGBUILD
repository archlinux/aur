# Maintainer: Jorge Pizarro-Callejas (jorgicio) <jpizarrocallejas@gmail.com>
pkgname=dnslookup
pkgver=1.10.1
pkgrel=1
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=('any')
url="https://github.com/ameshkov/dnslookup"
license=('GPL3')
depends=()
makedepends=('go>=1.20')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ameshkov/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7b6ffb70136210ee321dee3e30a4c2b97958f7286cc7f0979aab3d8ed8ea723')
conflicts=('dnslookup-git' 'dnslookup-bin')

prepare() {
    cd ${srcdir}/$pkgname-$pkgver
}

build(){
    cd "${srcdir}/$pkgname-$pkgver"
    mkdir -p "${srcdir}/gopath"
    export GOPATH="${srcdir}/gopath"
    export GOFLAGS="-modcacherw"
    go install -x -v -buildmode=pie -ldflags "-s -w" -trimpath
}

package(){
    mkdir -p $pkgdir/usr/bin
    install $srcdir/gopath/bin/$pkgname $pkgdir/usr/bin/$pkgname
}
