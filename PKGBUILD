# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pycklink
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Python interface for the T-HEAD CKLink"
arch=('any')
url="https://pypi.org/project/pycklink"
license=('MIT')
groups=()
depends=(
    gcc-libs
    glibc
    libusb
    python)
_pymakedeps=(
    build
    installer
    wheel
    setuptools)
makedepends=(
    "${_pymakedeps[@]/#/python-}")
checkdepends=()
optdepends=()
provides=(cklink pycklink)
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('51bddaef6575e4591eca8ed191b8cc6a3e9f694adc0bc46445149b354baafe4b')
#validpgpkeys=()

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
