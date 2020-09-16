# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="nojava-ipmi-kvm-docker"
pkgver="0.9.0"
pkgrel="2"
pkgdesc="A tool to access Java based ipmi kvm consoles without a local Java installation (Docker dependency)."
arch=("x86_64")
url="https://github.com/sciapp/nojava-ipmi-kvm"
license=("MIT")
depends=("docker" "python" "python-requests" "python-pyaml" "python-yacl")
makedepends=("python-setuptools")
optdepends=("python-pyqtwebengine: GUI support")
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}-podman")
source=("https://github.com/sciapp/nojava-ipmi-kvm/archive/v${pkgver}.tar.gz")
sha256sums=("cb0a3fb04e1ca71b70dc44aa4d738c7f7502b79cfbbc85d991909e44830c5100")

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
