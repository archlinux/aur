# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgbase=python-moteus
pkgname=(python-moteus python-moteus-gui)
_name0=${pkgname[0]#python-}
_name1=${pkgname[1]#python-}
pkgver=0.3.97
pkgrel=1
pkgdesc="moteus brushless controller library and tools"
url="https://pypi.org/project/moteus/"
arch=('any')
license=('Apache-2.0')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${_name0::1}/$_name0/${_name0//-/_}-$pkgver-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/py3/${_name1::1}/$_name1/${_name1//-/_}-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/mjbots/fdcanusb/master/70-fdcanusb.rules")

sha256sums=('389392d6db83822ae1f32f06b59fdb8289252f74ad27edd1878c5dee2b2362ae'
            '2676e35a312f14375f9a11061a1647e12d01bef61764cb57da41818cbf93fdff'
            '6008f3b20baca0e4a077bc45c8e541717d6e3fc63ba7621dc3b1bcb14d86cb23')

package_python-moteus() {
    depends=('python-importlib-metadata' 'python-pyelftools' 'python-pyserial' 'python-can')

    python -m installer --destdir="$pkgdir" "${_name0//-/_}-$pkgver-py3-none-any.whl"
    install -Dm 644 70-fdcanusb.rules "$pkgdir/etc/udev/rules.d/70-fdcanusb.rules"
}

package_python-moteus-gui() {
    depends=('pyside6' 'python-asyncqt' 'python-matplotlib' 'python-moteus' 'python-numpy' 'python-qtconsole' 'python-qtpy')

    python -m installer --destdir="$pkgdir" "${_name1//-/_}-$pkgver-py3-none-any.whl"
}
