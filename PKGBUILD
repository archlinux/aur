# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgbase=python-moteus
pkgname=(python-moteus python-moteus-gui)
_name0=${pkgname[0]#python-}
_name1=${pkgname[1]#python-}
pkgver=0.3.87
pkgrel=1
pkgdesc="moteus brushless controller library and tools"
url="https://pypi.org/project/moteus/"
arch=('any')
license=('Apache-2.0')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${_name0::1}/$_name0/${_name0//-/_}-$pkgver-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/py3/${_name1::1}/$_name1/${_name1//-/_}-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/mjbots/fdcanusb/master/70-fdcanusb.rules")

sha256sums=('c7be68e527fdf64a3a12446d736b1008bfca211a6928b79a3abcf2fb1af17e49'
            '5afa49d04d177805b30c77db2d83623682090a67d2960f5a555f3d05c8a31a38'
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
