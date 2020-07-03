# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="nojava-ipmi-kvm-docker"
pkgver="0.8.0"
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
sha256sums=("e03a8002ec36942f6a1b4af66fdfa48f2ea12f96dacb7e115ff1572b6dbebb8e")

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
