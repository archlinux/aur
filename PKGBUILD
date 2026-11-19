# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-pandana"
_name=${pkgname#python-}
pkgdesc="A Python library for network analysis"
url="http://udst.github.io/pandana/"

pkgver=0.8.1
pkgrel=1

arch=("x86_64")
license=("AGPL-3.0-only")

makedepends=(
    "cython"
    "python-build"
    "python-installer"
    "python-oldest-supported-numpy"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "python"
    "python-numpy"
    "python-pandas"
    "python-pytables"
    "python-requests"
    "python-scikit-learn"
)
optdepends=(
    "python-osmnet"
)

source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=(
    "e3299d1c3478adb2a7d8f2e2a0136bcf46dd17c3f19b7130019d4e01daa77cab30a5eb43b1b10d5861fe762cfe19c61bba59bb2c51bb5d2bb0c030babaabc658"
)

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}


package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
