# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
pkgver=0.6.5
pkgrel=1
pkgdesc="Yet another Discord overlay for Linux written in Python using GTK3"
arch=("x86_64")
url="https://trigg.github.io/Discover/"
license=("GPL3")
makedepends=("python-setuptools")
depends=(
    "gtk3"
    "libappindicator-gtk3"
    "python-gobject"
    "python-pyxdg"
    "python-requests"
    "python-websocket-client"
    "python-cairo"
    "python-pillow"
    "python-xlib"
)
conflicts=("discover-overlay-git")
provides=("discover-overlay")
optdepends=("gtk-layer-shell: Wayland support")
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/d/discover-overlay/${pkgname}-${pkgver}.tar.gz")
sha512sums=("4ef5f091aadb6ebde917577f850cc02aacf288189705328c5c023dc186e8b8cdca4f1b70f2155187d2ee538cffe062b1b68450f103b0a9bd007e18715e9860af")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -B setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export PYTHONHASHSEED=0
    python -B setup.py install --root="${pkgdir}/" --skip-build

    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
