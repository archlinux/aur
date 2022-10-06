# Maintainer: Niels Huylebroeck <arch@nightwalkers.be>
pkgname=sway-input-config-git
_pkgname=sway-input-config
pkgver=r24.f2fa178
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
source=("${pkgname%-*}::git+https://github.com/Sunderland93/sway-input-config.git#branch=master")
sha256sums=("SKIP")
provides=("sway-input-config")
conflicts=("sway-input-config")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --skip-build --optimize 1 --root="${pkgdir}"
}
