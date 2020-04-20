# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>

pkgname=gmtrn-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple CLI client for http://multitran.ru"
arch=('x86_64' 'i686')
url="https://github.com/vladimir-g/gmtrn"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/vladimir-g/gmtrn/archive/v${pkgver}.tar.gz")
sha256sums=('13972a3a9b1871eb293793add083e9ff301f4bccca6a247aa21a70464cd905c5')
_srcname=gmtrn

build() {
    export GOPATH="${srcdir}"
    cd ${_srcname}-${pkgver}/cmd/${pkgname}
    go build \
       -trimpath \
       -ldflags "-extldflags $LDFLAGS" \
       -o $pkgname .
}

package() {
    cd ${_srcname}-${pkgver}
    install -Dm755 cmd/${pkgname}/${pkgname} "$pkgdir"/usr/bin/$pkgname
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
