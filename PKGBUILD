# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="nojava-ipmi-kvm-podman"
pkgver="0.7.2"
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
sha256sums=("f3791ad8d78780ebf27e3e37bbcbf9ea80b5a522086a6e7e630b7f4f7db0a0a3")

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
