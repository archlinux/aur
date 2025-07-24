# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgbase=python-moteus
pkgname=(python-moteus python-moteus-gui)
_name0=${pkgname[0]#python-}
_name1=${pkgname[1]#python-}
pkgver=0.3.90
pkgrel=1
pkgdesc="moteus brushless controller library and tools"
url="https://pypi.org/project/moteus/"
arch=('any')
license=('Apache-2.0')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${_name0::1}/$_name0/${_name0//-/_}-$pkgver-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/py3/${_name1::1}/$_name1/${_name1//-/_}-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/mjbots/fdcanusb/master/70-fdcanusb.rules")

sha256sums=('37508e6a1934de83d1533c87ec6d626d057eee6fa17f2fcf1f3efabb3406c976'
            '89beb5d89dec910b3f1cf5d9145d0014185db34b753bbbb6c5f7d39f88e9d3e0'
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
