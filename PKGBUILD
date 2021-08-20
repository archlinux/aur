# Maintainer: AkinoKaede <autmaple@protonmail.com>

pkgname=sagerconnect
pkgver=0.1.7
pkgrel=1
pkgdesc="Connect to SagerNet in the LAN"
arch=('x86_64')
url="https://github.com/SagerNet/SagerConnect"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('57af2c7e980083e404bf2f3bb2b1ca8772b8acc81595e70d549535e680deea71cbd216e380e88812473ad618ebad8e81a2fa6b2fd6c82f6d80875536bccffa82')
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
