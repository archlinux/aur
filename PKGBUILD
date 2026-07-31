# Maintainer: taotieren <admin@taotieren.com>

pkgname=gd32-isp-console-bin
pkgver=5.1.0.39154
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
    glib2
    libgcc_s.so
    libstdc++.so
    libz.so
    libusb
    openssl
)
makedepends=(libarchive)
backup=()
options=('!strip')
install=${pkgname}.install
source=(
    "${url}/data/documents/toolSoftware/GD32_ISP_CLI_Linux_V${pkgver}.tar.gz"
    ${pkgname}.install)
sha256sums=('340e492f28a474bca28aed57c49e086a2e44b19582c37efafe4d43b135eebd43'
            '741827e445890d9538d127fdee7c3aa0b20ad68ac6194692e9f19283c952f6c1')

noextract=("GD32_ISP_CLI_Linux_V${pkgver}.tar.gz")

package() {
    install -dm0755 "${pkgdir}/opt/GD32" \
        "${pkgdir}/usr/bin"

    #     unar -e GBK "${srcdir}/GD32_ISP_CLI_Linux_V${pkgver}.tar.gz" -o "${pkgdir}/opt/GD32"
    bsdtar -xf "${srcdir}/GD32_ISP_CLI_Linux_V${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/GD32"

    cd "${pkgdir}/opt/GD32/GD32_ISP_CLI/bin"
    chmod 0755 GD32_ISP_CLI

    ln -sf "/opt/GD32/GD32_ISP_CLI/bin/GD32_ISP_CLI" "${pkgdir}/usr/bin/gd32-isp-cli"
}
