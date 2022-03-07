# Maintainer: taotieren <admin@taotieren.com>

pkgname=rv-link-udev-git
pkgver=0.2.1.r95.g04f3781
pkgrel=1
pkgdesc="A JTAG emulator/debugger for RISC-V micro-controllers that runs on a RISC-V development board (Sipeed Longan Nano for example)."
arch=('any')
url="https://github.com/michahoiting/rv-link"
license=('MulanPSL')
provides=(${pkgname%-git})
conflicts=()
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
    git describe --long --tags | sed 's/^v//g' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm0644 "${srcdir}/${pkgname%-git}/drivers/udev/rules.d/99-rvlink-jtag.rules" "${pkgdir}/usr/lib/udev/rules.d/99-rvlink-jtag.rules"
}
