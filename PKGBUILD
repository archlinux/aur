# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
pkgver=0.6.2
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
sha512sums=("ea0e95f0f67d4bdae9d12e6d242572cb1cafd1635f9a12d4990b1646017e2a9fb7612b953d73bf142cf962ffef484ca9bfeb8c4b4e058c390520abe38deeac36")

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
