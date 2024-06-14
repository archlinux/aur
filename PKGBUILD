# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-odrive
_name=${pkgname#python-}
pkgver=0.6.9.post0
pkgrel=1
pkgdesc="Control utilities for the ODrive high performance motor controller"
url="https://pypi.org/project/odrive/"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'ipython' 'python-pyelftools' 'python-pyusb' 'python-setuptools')
makedepends=('python-installer')
optdepends=('python-matplotlib: required to run the liveplotter')

_py=py37
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-none-manylinux_2_28_$CARCH.whl"
        "https://cdn.odriverobotics.com/files/odrive-udev-rules.rules")

sha256sums=('SKIP'
            'b574486e0fcdf13f2faa7165f5634d466353274547ab4d3a36b75f67c7124d3c')
noextract=()

package() {
    python -m installer --destdir="$pkgdir" *.whl
    install -Dm 644 odrive-udev-rules.rules "$pkgdir/etc/udev/rules.d/91-odrive.rules"
}
