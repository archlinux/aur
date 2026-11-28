# Maintainer: ray-powered <xinyuwei1024@gmail.com>

pkgname=ur22c-dkms
_pkgbase=ur22c-snd-usb-audio
_dkmsver=1.0
pkgver=0.1.0
pkgrel=1
pkgdesc="Out-of-tree snd-usb-audio DKMS patches for Steinberg UR22C 6-out/8-in multi-bus mode"
arch=('any')
url="https://github.com/ray-powered/ur22c-dkms"
license=('GPL-2.0-only')
depends=('dkms' 'git' 'patch' 'curl')
optdepends=(
    'psmisc: holder detection if running manual install.sh reload'
    'ur22c-control: mixer TUI, FX editor, udev rule, and PipeWire multi-bus configs'
)
provides=("${_pkgbase}")
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.install"
)
sha256sums=('138c69cb7f444f2ecf2988f6cf1c5fa4d1c444cdf43e0a448784c4db680efd2c'
            '86958938f38c0bec75bf53fa1ea66d797fd81bd2f42e7da4b6c83d582ebdc501')

package() {
    cd "${pkgname}-${pkgver}"

    local dkmsdir="${pkgdir}/usr/src/${_pkgbase}-${_dkmsver}"
    install -Dm644 dkms.conf Makefile.oot 0002-ur22c.patch 0003-ur22c-format.patch \
        -t "$dkmsdir"
    install -Dm755 install.sh "${dkmsdir}/install.sh"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
