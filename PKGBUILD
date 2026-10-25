# Maintainer: devome <evinedeng@hotmail.com>

pkgname=gosu
pkgver=1.20
pkgrel=1
pkgdesc="Simple Go-based setuid+setgid+setgroups+exec"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/tianon/${pkgname}"
license=("Apache-2.0")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('207a2045e890d3ca3326027c5f585733085960b401a49dbc00e3bb628c054cf8')
validpgpkeys=('B42F6819007F00F88E364FD4036A9C25BF357DD4')

build() {
    cd "${pkgname}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    go build -trimpath -ldflags="-s -w -extldflags '${LDFLAGS}'"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
