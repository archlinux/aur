# Maintainer: Nk-YMZ <village_flute at outlook dot com>
# Contributor: dlock

pkgname=deepcool-lm-arkui
pkgver=1.3.0
pkgrel=1
pkgdesc="Enhanced Deepcool LM LCD driver: AMD support, improved detection and Ark UI"
arch=('any')
url="https://github.com/Nk-YMZ/deepcool-lm"
license=('MIT')
depends=(
    'python'
    'python-pyusb'
    'python-psutil'
    'python-pillow'
    'lm_sensors'
    'ttf-dejavu'
    'pciutils'
    'usbutils'
)
provides=("deepcool-lm=${pkgver}")
conflicts=('deepcool-lm')
backup=('etc/systemd/system/deepcool-lm.service')
install=deepcool-lm.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f52430c19d7341c42ebbac42a7ec8938eba205ac2e887197fe8528989de3fbc5')

check() {
    cd "deepcool-lm-${pkgver}"
    python -m unittest discover -s tests -v
    python -m py_compile deepcool-lm deepcool_lm_display.py deepcool_lm_system.py deepcool-lm-preview
}

package() {
    cd "deepcool-lm-${pkgver}"
    install -Dm755 deepcool-lm "${pkgdir}/usr/bin/deepcool-lm"
    install -Dm644 deepcool_lm_display.py "${pkgdir}/usr/lib/deepcool-lm/deepcool_lm_display.py"
    install -Dm644 deepcool_lm_system.py "${pkgdir}/usr/lib/deepcool-lm/deepcool_lm_system.py"
    install -Dm644 deepcool-lm.service "${pkgdir}/etc/systemd/system/deepcool-lm.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/deepcool-lm/README.md"
}
