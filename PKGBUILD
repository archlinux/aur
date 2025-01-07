# Maintainer: taotieren <admin@taotieren.com>

pkgname=gd32-isp-console-bin
pkgver=4.0.5.26748
pkgrel=1
pkgdesc="GigaDevice MCU ISP Console for Linux"
arch=('x86_64')
url="https://www.gd32mcu.com"
license=('unknow')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
#replaces=(${pkgname})
depends=(
    dbus
    gcc-libs
    glib2
    glibc
    libusb
    openssl
    zlib
)
makedepends=(libarchive)
backup=()
options=('!strip')
install=${pkgname}.install
source=(
    "${url}/data/documents/toolSoftware/GD32_ISP_CLI_Linux_V${pkgver}.tar.gz"
    ${pkgname}.install)
sha256sums=('5a393c9d62136ea14a522964bd7d64c74a56c025f6561f51a873f9a288118924'
            'e91208b4418a7cc73b7059a822658ef0cd08327ec87d0176b95b94d44c2121b9')

noextract=("GD32_ISP_CLI_Linux_V${pkgver}.tar.gz")

package() {
    install -dm0755 "${pkgdir}/opt/GD32" \
        "${pkgdir}/usr/bin"

    #     unar -e GBK "${srcdir}/GD32_ISP_CLI_Linux_V${pkgver}.tar.gz" -o "${pkgdir}/opt/GD32"
    bsdtar -xf "${srcdir}/GD32_ISP_CLI_Linux_V${pkgver}.tar.gz" -C "${pkgdir}/opt/GD32"

    cd "${pkgdir}/opt/GD32/GD32_ISP_CLI/bin"
    chmod 0755 GD32_ISP_CLI

    ln -sf "/opt/GD32/GD32_ISP_CLI/bin/GD32_ISP_CLI" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
