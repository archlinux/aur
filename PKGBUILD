# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
pkgver=0.4.5
pkgrel=1
pkgdesc="Yet another Discord overlay for Linux written in Python using GTK3"
arch=("x86_64")
url="https://pypi.org/project/discover-overlay/"
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
)
conflicts=("discover-overlay-git")
provides=("discover-overlay")
optdepends=("gtk-layer-shell: Wayland support")
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/d/discover-overlay/${pkgname}-${pkgver}.tar.gz")
sha512sums=("6a7121c0923a68bf6b278b6985a82a3bba98b155c8812056cc0532961cb54ee5045c1279a32fdde8708a15f444d2a2ba0afdeea61f79a89cc542b3a1d5b2aed4")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
