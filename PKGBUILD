# Maintainer: Hao Long <aur@esd.cc>

pkgname=naabu
pkgver=1.1.1
pkgrel=1
pkgdesc="A fast port scanner written in go with focus on reliability and simplicity"
arch=("x86_64" "i686")
url="https://github.com/projectdiscovery/naabu"
license=("GPL3")
depends=("libpcap")
makedepends=("dep" "go")
source=("https://github.com/projectdiscovery/naabu/archive/v${pkgver}.tar.gz")
sha256sums=('94dbe51431b79bbdaa142a312e64dcbdeb273d513e52bbc01cf13650424660b1')

build() {
    export GOPATH="$srcdir/gopath"
    mkdir -p $GOPATH/src/github.com/projectdiscovery/
    cp -r "${srcdir}/naabu-$pkgver" "$GOPATH/src/github.com/projectdiscovery/naabu"
    cd "$GOPATH/src/github.com/projectdiscovery/naabu"
    dep ensure
    cd "$GOPATH/src/github.com/projectdiscovery/naabu/cmd/naabu"
    go build
}

package() {
    export GOPATH="$srcdir/gopath"
    cd "$GOPATH/src/github.com/projectdiscovery/naabu"
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 cmd/naabu/naabu ${pkgdir}/usr/bin/naabu
}
