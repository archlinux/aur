# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgbase=python-moteus
pkgname=(python-moteus python-moteus-gui)
_name0=${pkgname[0]#python-}
_name1=${pkgname[1]#python-}
pkgver=0.3.93
pkgrel=1
pkgdesc="moteus brushless controller library and tools"
url="https://pypi.org/project/moteus/"
arch=('any')
license=('Apache-2.0')
makedepends=('python-installer')

source=("https://files.pythonhosted.org/packages/py3/${_name0::1}/$_name0/${_name0//-/_}-$pkgver-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/py3/${_name1::1}/$_name1/${_name1//-/_}-$pkgver-py3-none-any.whl"
        "https://raw.githubusercontent.com/mjbots/fdcanusb/master/70-fdcanusb.rules")

sha256sums=('390855cd99ac1fb80529e096a1970dbff69ab9b66e6c155ced7014440063ec8b'
            'd55f7e2b117047b4290fd5aad686daf9fad1fbcb5c3e27ae39c59a5ade5c1033'
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
