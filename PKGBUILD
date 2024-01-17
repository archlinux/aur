# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-odrive
_name=${pkgname#python-}
pkgver=0.6.8
pkgrel=1
pkgdesc="Control utilities for the ODrive high performance motor controller"
url="https://pypi.org/project/odrive/"
arch=('any')
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'ipython' 'python-pyelftools' 'python-pyusb' 'python-setuptools')
makedepends=('python-installer')
optdepends=('python-matplotlib: required to run the liveplotter')

source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
        "https://cdn.odriverobotics.com/files/odrive-udev-rules.rules")

sha256sums=('33d6a9b90ddd2dbc24223ed0a856962f3ac33b0b0d5159fd49a8516990cbf87d'
            'b574486e0fcdf13f2faa7165f5634d466353274547ab4d3a36b75f67c7124d3c')
noextract=()

package() {
    python -m installer --destdir="$pkgdir" "${_name//-/_}-$pkgver-py3-none-any.whl"
    install -Dm 644 odrive-udev-rules.rules "$pkgdir/etc/udev/rules.d/91-odrive.rules"
}
