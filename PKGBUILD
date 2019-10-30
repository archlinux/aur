# Maintainer: Sebastian Meßlinger <sebastian.messlinger@posteo.de>
pkgname=dnslookup-git
pkgver=r10.ae36d05
pkgrel=2
pkgdesc="Simple command line utility to make DNS lookups to the specified server"
arch=('any')
url="https://github.com/ameshkov/dnslookup"
license=('GPL3')
depends=()
makedepends=('go' 'git')
source=('git://github.com/ameshkov/dnslookup.git')
sha1sums=('SKIP')

pkgver() {
        cd "${srcdir}/dnslookup"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
    cd "${srcdir}/dnslookup"
    mkdir -p "${srcdir}/gopath"
    export GOPATH="${srcdir}/gopath"
    go install -x -v -buildmode=pie -ldflags "-s -w" -trimpath
}

package(){
    mkdir -p $pkgdir/usr/bin
    install $srcdir/gopath/bin/dnslookup $pkgdir/usr/bin/dnslookup
}
