# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>

pkgname=gmtrn-cli
pkgver=0.1
pkgrel=1
pkgdesc="Simple CLI client for http://multitran.ru"
arch=('x86_64' 'i686')
url="https://github.com/vladimir-g/gmtrn"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("https://github.com/vladimir-g/gmtrn/archive/v${pkgver}.tar.gz")
sha256sums=('a3caab19db19f771ea91b99a5138df61a3991fe2bfea2f521a7a91d06f29c030')
_srcname=gmtrn
_gourl=github.com/vladimir-g/${_srcname}

build() {
    export GOROOT=/usr/lib/go
    rm -rf "${srcdir}/build"
    mkdir -p "${srcdir}/build"
    export GOPATH="${srcdir}/build"
    mkdir -p "${GOPATH}/src/github.com/vladimir-g"
    mv "${_srcname}-${pkgver}" "${GOPATH}/src/${_gourl}"
    cd "${GOPATH}/src/${_gourl}/cmd/${pkgname}"
    go get
    go build
}

package() {
    cd "${srcdir}/build/src/${_gourl}"
    install -Dm755 "cmd/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
