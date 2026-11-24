# Maintainer: Guru <anjanaya@gmail.com>
pkgname=pgterm-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Modern Postgres terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/pgrundev/pgterm"
license=('Apache-2.0')
provides=('pgterm')
conflicts=('pgterm')
options=('!debug')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pgrundev/pgterm/releases/download/v${pkgver}/pgterm_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pgrundev/pgterm/releases/download/v${pkgver}/pgterm_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d96a72173b3c382e378438bfb7c0b87c2d3ea63d8ffc9fc0eb89f4a3ec5b62ed')
sha256sums_aarch64=('678714a68b1b7bd80bfcb6c0fc3b517bb1d1170f128c219adf9e0ceb9cca9642')

package() {
    local _uarch
    case "${CARCH}" in
        x86_64)  _uarch='amd64' ;;
        aarch64) _uarch='arm64' ;;
    esac
    cd "${srcdir}/pgterm_${pkgver}_linux_${_uarch}"
    install -Dm755 pgterm "${pkgdir}/usr/bin/pgterm"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
