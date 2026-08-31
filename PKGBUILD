# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-odrive
_name=${pkgname#python-}
pkgver=0.6.11.post1
pkgrel=1
pkgdesc="Control utilities for the ODrive high performance motor controller"
url="https://pypi.org/project/odrive/"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'ipython' 'python-pyelftools' 'python-pyusb' 'python-jsonschema' 'python-colorama' 'python-setuptools')
makedepends=('python-installer')
optdepends=('python-matplotlib: required to run the liveplotter')

_py=py37
source=("https://cdn.odriverobotics.com/files/odrive-udev-rules.rules")
source_x86_64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-none-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-none-manylinux_2_28_aarch64.whl")

sha256sums=('b574486e0fcdf13f2faa7165f5634d466353274547ab4d3a36b75f67c7124d3c')
sha256sums_x86_64=('468908dd87bc12719d9454cc12ad8ce9a2743854f161509e4102847a0bd21a11')
sha256sums_aarch64=('43d8b9ce9ba7e31712b608f944120012570ae66b6085b3167a8e9fabcffc7f1b')

package() {
    python -m installer --destdir="$pkgdir" ${_name//-/_}-$pkgver-$_py-none-manylinux_2_28_$CARCH.whl
    install -Dm 644 odrive-udev-rules.rules "$pkgdir/etc/udev/rules.d/91-odrive.rules"
}
