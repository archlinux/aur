# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://github.com/qmk/qmk_firmware

pkgname=qmk-udev-rules-git
pkgver=0.23.6.r0.g3495cbc6382
pkgrel=1
pkgdesc="Udev rules to own qmk supported keyboards in bootloader mode"
arch=('any')
url="https://github.com/qmk/qmk_firmware"
license=('GPL-2.0')
depends=('systemd')
makedepends=('git')
conflicts=('qmk-udev-rules' 'qmk' 'qmk-git')
source=("qmk-firmware::git+https://github.com/qmk/qmk_firmware")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/qmk-firmware"
    git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
    install -m 644 "${srcdir}/qmk-firmware/util/udev/50-qmk.rules" "${pkgdir}/usr/lib/udev/rules.d/50-qmk.rules"
}
