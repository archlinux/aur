# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

_basename="nojava-ipmi-kvm"
pkgname="${_basename}-docker-git"
pkgver="0.9.2.r2.g624338d"
pkgrel="1"
pkgdesc="A tool to access Java based ipmi kvm consoles without a local Java installation (Docker dependency)."
arch=("x86_64")
url="https://github.com/sciapp/${_basename}"
license=("MIT")
depends=("docker" "python" "python-requests" "python-yaml" "python-yacl")
makedepends=("python-setuptools")
optdepends=("python-pyqtwebengine: GUI support")
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/sciapp/${_basename}.git#branch=develop")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname%-*}" || return
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-*}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-*}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
