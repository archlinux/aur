# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=switchyard
pkgver=0.1.0
pkgrel=1
pkgdesc='A lightweight bridge that accepts email over SMTP and forwards each message to XMPP'
arch=('x86_64')
license=('Custom: SEGV License')
url='https://tty.fail/mrus/switchyard'
source=("git+${url}.git#tag=v$pkgver")
makedepends=('git' 'go')
options=(!lto)
sha256sums=('61502f7b086fee9824f2d7a9cc22fd30c79c95f4478ae0b9991a001c86b2ed8d')

prepare() {
    cd "$pkgname"
    make test
}

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    make build
}

package() {
    cd "$pkgname"
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
