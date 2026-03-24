# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_pkgbase=snd-dante-pcie
pkgname=${_pkgbase}-dkms
pkgver=0.0.1
pkgrel=2
pkgdesc="ALSA kernel driver for Digigram LX-DANTE / Audinate Dante PCIe cards"
arch=('x86_64')
url="https://github.com/chris-ritsen/snd-dante-pcie"
license=('GPL')
depends=('dkms')
optdepends=('python-numpy: dante-live dashboard')
provides=("${_pkgbase}")
conflicts=('dante-pcie-dkms' "${_pkgbase}-dkms-git")
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/chris-ritsen/snd-dante-pcie/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${_pkgbase}-${pkgver}"

    install -Dm644 snd-dante-pcie.c "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/snd-dante-pcie.c"
    install -Dm644 Makefile "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile"
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    install -Dm755 dante-live.py "${pkgdir}/usr/bin/dante-live"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/${pkgname}.conf" <<EOF
blacklist dante_pcie
EOF
}
