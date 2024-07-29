# Maintainer: Marcin Kornat <rarvolt@gmail.com>
pkgname=dymoprint
pkgver=2.5.0
pkgrel=2
pkgdesc="Linux Software to print with LabelManager PnP from Dymo"
arch=('any')
license=('Apache')
conflicts=()
provides=('dymoprint')
url="https://github.com/computerlyrik/dymoprint"
depends=(
    'python'
    'python-appdirs' 
    'python-pillow'
    'python-pyqrcode'
    'python-barcode'
    'python-pyusb'
    'python-pyqt6'
    'python-importlib-metadata'
    )
makedepends=(
    'git'
    'python-pip'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-hatchling'
    'python-hatch-vcs<0.4'
    )
source=(
        "${pkgname}-${pkgver}::git+https://github.com/computerlyrik/dymoprint.git#tag=v${pkgver}"
        "91-dymo-labelmanager-pnp.rules"
        "dymo-labelmanager-pnp.conf"
    )
sha512sums=('73053c97130c01a9dee72a1ca1a2b8fa39827e1a32ee6d99fa9b9909f33079d0388234d92a47d71918fc0037e3b4ec4313363353e72fdf46c2e7cbe1e8293ab9'
            '76c4d8b9b9abd6c9100b6d0032af0d3752fbb7827f2d3a8417b28d2b822b9f7956051163de015a26e0fa6c548851a0f73e74bea37d1c1583cc457a9dc6be6b68'
            'a73a5cd46e020d9d43d18cf52927085f055b9d3e77d5ed98f254e3fff07b053aff1125e931b2fd984f08dcb501d344544dc2de58adb66270455b4f482bc8f3f1')

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
