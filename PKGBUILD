# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
pkgver=0.6.3
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
sha512sums=("a7ac4577a90efa06914cabf742911f173943e3fb7a310daf69d154a51a80bfde70ea427425b15082ee15478d981a4f6a15f0e27d15481294fb9e7ebb6037670b")

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
