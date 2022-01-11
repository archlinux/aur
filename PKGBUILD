# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=dymoprint
pkgver=1.2.0
pkgrel=1
pkgdesc="Linux Software to print with LabelManager PnP from Dymo"
arch=('any')
license=('Apache')
conflicts=()
provides=('dymoprint')
url="https://github.com/computerlyrik/dymoprint"
depends=(
    'python-appdirs' 
    'python-pillow'
    'python-pyqrcode'
    'python-barcode'
    'usb_modeswitch'
    )
makedepends=('python-pip')
source=(
        "https://files.pythonhosted.org/packages/e6/04/0df45c240e2568bd2ad77eabe167650615e8a8cf36d5155fb6bc1eb38402/${pkgname}-${pkgver}-py2.py3-none-any.whl"
        "91-dymo-labelmanager-pnp.rules"
        "dymo-labelmanager-pnp.conf"
    )
noextract=("${pkgname}-${pkgver}-py2.py3-none-any.whl")
sha256sums=('1e4885fa4a82ad7d7af41beec90f68bd5cb28a1c7400309fbcf81c23ebd127fb'
            'edbbce0aac6fceb778fef854170144842fc444326bf9c1b86c314d6dbfe6b2e8'
            '73aa314b713171892672bf9f68468bec137b37c5a7a07513b6b25573bec4e99d')

package() {
    install -Dm644 91-dymo-labelmanager-pnp.rules "${pkgdir}/etc/udev/rules.d/91-dymo-labelmanager-pnp.rules"
    install -Dm644 dymo-labelmanager-pnp.conf "${pkgdir}/etc/usb_modeswitch.d/dymo-labelmanager-pnp.conf"

    cd "${srcdir}"
    PIP_CONFIG_FILE=/dev/null pip install \
        --no-warn-script-location \
        --isolated \
        --root="${pkgdir}" \
        --ignore-installed \
        --no-deps \
        *.whl
}
