# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>

pkgname=gmtrn-cli
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple CLI client for https://www.multitran.com"
arch=('x86_64' 'i686')
url="https://github.com/vladimir-g/gmtrn"
license=('MIT')
makedepends=('go')
options=('!emptydirs')
source=("https://github.com/vladimir-g/gmtrn/archive/v${pkgver}.tar.gz")
sha256sums=('b12fb6112e542859f9b44a5bbe156d16bc3b633323308e5cd2d3fd054cdceff8')
_srcname=gmtrn

build() {
    export GOPATH="${srcdir}"
    cd ${_srcname}-${pkgver}/cmd/${pkgname}
    go build \
       -trimpath \
       -buildmode=pie \
       -mod=readonly \
       -modcacherw \
       -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
       -o $pkgname .
}

package() {
    cd ${_srcname}-${pkgver}
    install -Dm755 cmd/${pkgname}/${pkgname} "$pkgdir"/usr/bin/$pkgname
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
