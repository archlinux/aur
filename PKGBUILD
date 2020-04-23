# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="nojava-ipmi-kvm-docker"
pkgver="0.6.0"
pkgrel="1"
pkgdesc="A tool to access Java based ipmi kvm consoles without a local Java installation (Docker dependency)."
arch=("x86_64")
url="https://github.com/sciapp/nojava-ipmi-kvm"
license=("MIT")
depends=("docker" "python" "python-requests" "python-yacl")
makedepends=("python-setuptools")
optdepends=("python-pyqtwebengine: GUI support")
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}-podman")
source=("https://github.com/sciapp/nojava-ipmi-kvm/archive/v${pkgver}.tar.gz")
sha256sums=("2d89a0ca546422b615a70794b9606ea78a4b238a0a7db2ab28a1f8a8feaefad0")

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
