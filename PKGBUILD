# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=SteamAccountSwitcher
pkgname=steamaccountswitcher-git
pkgver=r9.0e3fc48
pkgrel=2
pkgdesc="Qt 5/6 Steam account switcher for linux"
arch=("any")
url="https://github.com/ShayBox/${_pkgname}"
license=("MIT")
depends=(
    "steam"
    "python-qtpy"
)
makedepends=(
    "git"
    "python-pip"
    "python-poetry"
)
optdepends=(
    "python-pyqt5: Qt5"
    "python-pyqt6: Qt6"
)
source=(
    "git+${url}.git"
)
sha512sums=(
    "SKIP"
)

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
    install -Dm644 "data/share/applications/steamswitcher.desktop" "${pkgdir}/usr/share/applications/steamswitcher.desktop"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps dist/*.whl
}
