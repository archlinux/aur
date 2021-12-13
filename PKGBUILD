# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname="python-pyrobuf"
_name=${pkgname#python-}
pkgdesc="An alternative to Google's Python Protobuf library."
url="https://github.com/appnexus/pyrobuf"

pkgver=0.9.3
pkgrel=5

arch=("x86_64")
license=("Apache")

makedepends=(
    "python-pip"
    "python-pytest-runner"
    "python-setuptools"
    "python-wheel"
)
depends=(
    "cython"
    "python"
    "python-jinja"
)
# checkdepends=(
#     "python-pytest"
# )

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("9cca7f992c674645522247e23cf6c4d81cca42e5a65e4ae1d05f3967b0c07a80")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

# tests currently incomplete in PyPi packages: https://github.com/appnexus/pyrobuf/issues/160
# check() {
#     cd "${srcdir}"/${_name}-${pkgver}
#     local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
#     PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${python_version}" py.test
# }

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
