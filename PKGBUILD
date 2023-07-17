# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=dymoprint
pkgver=2.0.0
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
        "${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/45/3f/d9ce830ad960ab275de014e6a6b13aad41d04cb238759ad607cdf6a3b23f/${pkgname}-${pkgver}.tar.gz"
        "91-dymo-labelmanager-pnp.rules"
        "dymo-labelmanager-pnp.conf"
    )
sha256sums=('157abaeec0ea7fd46429e8f6b588a63dcfc6cbff774bdd3d16fd4a11fb86af4f'
            'edbbce0aac6fceb778fef854170144842fc444326bf9c1b86c314d6dbfe6b2e8'
            '73aa314b713171892672bf9f68468bec137b37c5a7a07513b6b25573bec4e99d')


build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 91-dymo-labelmanager-pnp.rules "${pkgdir}/etc/udev/rules.d/91-dymo-labelmanager-pnp.rules"
    install -Dm644 dymo-labelmanager-pnp.conf "${pkgdir}/etc/usb_modeswitch.d/dymo-labelmanager-pnp.conf"

    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
