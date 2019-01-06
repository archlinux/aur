# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=python-proc
pkgver=0.17
pkgrel=1
pkgdesc="Simple interface to Linux process information"
arch=("any")
url="https://github.com/xolox/python-proc"
license=("MIT")
depends=("python" "python-coloredlogs" "python-executor" "python-humanfriendly" "python-property-manager" "python-setuptools")
source=(
    "https://github.com/xolox/python-proc/archive/${pkgver}.tar.gz"
    "python37-compat.patch"
)
sha256sums=(
    "fa0cde2babdac512a251685d73036b956f509b12021b2051e285b3f29d321b46"
    "c1d469b3850b43df4e1b7d2097ebd2fba3e1e6786a750ca75585c3961f1ba9f8"
)

prepare() {
    cd "python-proc-${pkgver}"
    patch -p1 < "${srcdir}/python37-compat.patch"
}

package() {
    cd "python-proc-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-proc/LICENSE.txt"
}
