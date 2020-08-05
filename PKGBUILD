# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="nojava-ipmi-kvm-podman"
pkgver="0.8.1"
pkgrel="2"
pkgdesc="A tool to access Java based ipmi kvm consoles without a local Java installation (Podman dependency)."
arch=("x86_64")
url="https://github.com/sciapp/nojava-ipmi-kvm"
license=("MIT")
depends=("podman-docker" "python" "python-requests" "python-yacl")
makedepends=("python-setuptools")
optdepends=("python-pyqtwebengine: GUI support")
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}-docker")
source=("https://github.com/sciapp/nojava-ipmi-kvm/archive/v${pkgver}.tar.gz")
sha256sums=("3617880022e0a9c15f309232b924ebbcecfe0ee284721039c22dba28991be736")

build() {
    cd "${srcdir}/${pkgname%-*}-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname%-*}-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
