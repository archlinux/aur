# Maintainer: taotieren <admin@taotieren.com>

pkgname=gd32-isp-console-bin
pkgver=4.0.5.26748
pkgrel=2
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
            '741827e445890d9538d127fdee7c3aa0b20ad68ac6194692e9f19283c952f6c1')

noextract=("GD32_ISP_CLI_Linux_V${pkgver}.tar.gz")

package() {
    install -dm0755 "${pkgdir}/opt/GD32" \
        "${pkgdir}/usr/bin"

    #     unar -e GBK "${srcdir}/GD32_ISP_CLI_Linux_V${pkgver}.tar.gz" -o "${pkgdir}/opt/GD32"
    bsdtar -xf "${srcdir}/GD32_ISP_CLI_Linux_V${pkgver}.tar.gz" -C "${pkgdir}/opt/GD32"

    cd "${pkgdir}/opt/GD32/GD32_ISP_CLI/bin"
    chmod 0755 GD32_ISP_CLI

    ln -sf "/opt/GD32/GD32_ISP_CLI/bin/GD32_ISP_CLI" "${pkgdir}/usr/bin/gd32-isp-cli"
}
