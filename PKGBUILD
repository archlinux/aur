# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
pkgver=0.5.0
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
)
conflicts=("discover-overlay-git")
provides=("discover-overlay")
optdepends=("gtk-layer-shell: Wayland support")
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/d/discover-overlay/${pkgname}-${pkgver}.tar.gz")
sha512sums=("a8ba2dbe357b2b7a420caf25a46d86153f5db6b99b80ba4a7e37913ec21c056671201801d708d498533293fbc5de8c5ac7f573bad908f845e0c712fc855c79a5")

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
