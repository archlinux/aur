# Maintainer: Niels Huylebroeck <arch@nightwalkers.be>
pkgname=sway-input-config-git
_pkgname=sway-input-config
pkgver=r3.db2708e
pkgrel=1
license=("GPL3")
pkgdesc="Sway Input Configurator"
makedepends=(
  'git'
  'python-setuptools'
)
depends=(
    "qt5-wayland" "pyside2" "python-i3ipc" "sway"
)

arch=("i686" "x86_64")
url="https://github.com/Sunderland93/sway-input-config"
source=(
    "${pkgname%-*}::git+https://github.com/Sunderland93/sway-input-config.git#branch=master"
    "data_files.patch"
)
sha256sums=(
    "SKIP"
    "3f969a09be48e8c288039c41400eb9397a24ea3b08402f6f5e8c4b52d312b96a"
)
provides=("sway-input-config")
conflicts=("sway-input-config")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git apply ${srcdir}/data_files.patch
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --skip-build --optimize 1 --root="${pkgdir}"
}
