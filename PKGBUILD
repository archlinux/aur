# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=sagerconnect
pkgver=0.1.5
pkgrel=1
pkgdesc="Connect to SagerNet in the LAN"
arch=('x86_64')
url="https://github.com/SagerNet/SagerConnect"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('2e58835440d2c3908fb88bbaf6e264f25fe72c7bc4b5be6e7e8a1fe64451572401bd8dbf976bf52b8f45838946aa4b1e9f96b6d071b879179b605ae824c0abcb')
build() {
    cd "${srcdir}"/"SagerConnect-${pkgver}"/
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    go build -o sagerconnect .
}

package() {
    cd "${srcdir}"/"SagerConnect-$pkgver"/
    install -Dm 755 sagerconnect -t "${pkgdir}"/usr/bin/
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/sagerconnect/
}
