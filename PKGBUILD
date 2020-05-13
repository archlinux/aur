# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="nojava-ipmi-kvm-podman"
pkgver="0.7.0"
pkgrel="1"
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
sha256sums=("2d8c0079950a7018c4a3cfa7c4a6b34210ee287ae03d83c031dc6f28c5f4220d")

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
