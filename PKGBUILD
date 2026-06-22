# Maintainer: Chris Sutcliff <chris@sutcliff.me>
pkgname=keychron-battery-dkms
pkgver=0.1.2
pkgrel=1
pkgdesc="HID driver for Keychron mouse battery reporting via power_supply subsystem"
arch=('x86_64')
url="https://github.com/csutcliff/keychron-battery-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=()
optdepends=('linux-headers: build the module against the Arch stock kernel'
            'linux-lts-headers: build the module against the LTS kernel'
            'linux-cachyos-headers: build the module against the CachyOS kernel')
provides=('keychron-battery')
conflicts=('keychron-battery')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9353e2e9b10bf99931e9839079adde154c43d4137f06856a029d84bd86162a93')

package() {
    local install_dir="${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"

    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm644 keychron_battery.c "${install_dir}/keychron_battery.c"
    install -Dm644 Makefile "${install_dir}/Makefile"
    install -Dm644 dkms.conf "${install_dir}/dkms.conf"
}
