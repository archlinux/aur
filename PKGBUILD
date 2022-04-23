# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
pkgver=0.5.1
pkgrel=1
pkgdesc="Yet another Discord overlay for Linux written in Python using GTK3"
arch=("x86_64")
url="https://trigg.github.io/Discover/"
license=("GPL3")
makedepends=("python-setuptools")
depends=(
    "gtk3"
    "python-gobject"
    "python-pyxdg"
    "python-requests"
    "python-websocket-client"
    "python-pidfile"
    "python-cairo"
    "python-pillow"
    "python-xlib"
    "dbus-python"
)
conflicts=("discover-overlay-git")
provides=("discover-overlay")
optdepends=("gtk-layer-shell: Wayland support")
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/d/discover-overlay/${pkgname}-${pkgver}.tar.gz")
sha512sums=("c78103befaaf0711af2369ee224739635bf699ece37730d7ec01c69d57d2941c2a0edbe34a74c39c1b694fa89f14220eb8e19fb6a2e0ff9d257821e30c0d16cf")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -B setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export PYTHONHASHSEED=0
    python -B setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
