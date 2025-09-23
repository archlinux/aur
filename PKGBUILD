# Maintainer: devome <evinedeng@hotmail.com>

pkgname=gosu
pkgver=1.19
pkgrel=1
pkgdesc="Simple Go-based setuid+setgid+setgroups+exec"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/tianon/${pkgname}"
license=("Apache-2.0")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cd9719b775dbfedae53923c9b0dc792b66d42c51e0b36652ed6f747fbadc0164')
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
