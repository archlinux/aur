# Maintainer: taotieren <admin@taotieren.com>

pkgname=xfel-git
pkgver=v1.0.1.r5.g357492c
pkgrel=1
pkgdesc="Tiny FEL tools for allwinner SOC, support RISC-V D1 chip."
arch=('any')
url="https://github.com/xboot/xfel"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=('libusb')
makedepends=('git')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
