# Maintainer: Octopus118 <idlansdowne at gmail dot com>
pkgname=python-odrive
_name=${pkgname#python-}
pkgver=0.6.9.post0
pkgrel=2
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
sha256sums_x86_64=('28d7869eed8acc7c3f408462fb1da5bfe9486a2e0006f05bc9b5e9b140cfcb5d')
sha256sums_aarch64=('11478527059e196344127ced864fd9f0578ac5607daa83f15329ed5c7479e3ec')

package() {
    python -m installer --destdir="$pkgdir" ${_name//-/_}-$pkgver-$_py-none-manylinux_2_28_$CARCH.whl
    install -Dm 644 odrive-udev-rules.rules "$pkgdir/etc/udev/rules.d/91-odrive.rules"
}
