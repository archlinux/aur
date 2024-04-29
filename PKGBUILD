# Maintainer: BryanLiang <liangrui.ch at gmail dot com>

pkgname=tcping-go
pkgver=2.5.0
pkgrel=2
pkgdesc="A cross-platform ping program for TCP ports inspired by the Linux's ping utility."
arch=('x86_64' 'aarch64')
url='https://github.com/pouriyajamshidi/tcping'
license=('MIT')
conflicts=("${pkgname}-bin" "${pkgname}-git" "tcping")
makedepends=('go')
depends=('glibc')

source=("tcping-go-${pkgver}.tar.gz::${url}/archive/refs/tags/v2.5.0.tar.gz")

sha256sums=('ac328e1b6954254e5f0a9da70cbe495dc6615f59197e067f5adb7df11886df83')

build() {
    cd "tcping-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export GOPATH="${srcdir}"

    go build -o ../tcping -ldflags "-s -w"
}

package() {
    cd "${srcdir}"
    install -Dm 755 tcping "${pkgdir}/usr/bin/tcping"
    install -Dm 644 "tcping-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/tcping-go/LICENSE"
}
