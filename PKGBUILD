# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
_pkgrelname=Discover
pkgver=0.7.0
pkgrel=2
pkgdesc="Yet another Discord overlay for Linux written in Python using GTK3"
arch=("x86_64")
url="https://github.com/trigg/${_pkgrelname}"
license=("GPL3")
makedepends=(
    "python-build"
    "python-wheel"
    "python-installer"
)
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
    "python-setuptools"
)
conflicts=("discover-overlay-git")
provides=("discover-overlay")
optdepends=("gtk-layer-shell: Wayland support")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("e7f00e1087251559fab5ed033bde059ea87ea45eb6fbe1782442253126281cae51b6d296bbae0cb11503ccf082fe22654ff129687f73c467ad8a2406bbe35bd8")

build() {
    cd "${srcdir}/${_pkgrelname}-${pkgver}"

    python -B -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgrelname}-${pkgver}"

    python -B -m installer --destdir="${pkgdir}" dist/*.whl

    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
