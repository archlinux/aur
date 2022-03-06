# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=riden
pkgname="python-${_pkgname}-git"
pkgver=r19.d070961
pkgrel=2
pkgdesc="A python library for Riden RD power supplies"
arch=("any")
url="https://github.com/shaybox/${_pkgname}"
license=("MIT")
depends=(
    "python"
    "python-click"
    "python-modbus-tk"
    "python-pyserial"
)
makedepends=(
    "python-poetry"
)
provides=("${_pkgname}" "python-${_pkgname}")
source=("git+${url}.git")
sha512sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    poetry build --format wheel
}

package() {
    cd "${srcdir}/${_pkgname}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
}
