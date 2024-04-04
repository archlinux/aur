# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
_name=${pkgname#python-}
pkgver=0.7.3
pkgrel=1
pkgdesc="Yet another Discord overlay for Linux written in Python using GTK3"
arch=("x86_64")
url="https://github.com/trigg/Discover"
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
    "python-pulsectl-asyncio"
)
conflicts=("discover-overlay-git")
provides=("discover-overlay")
optdepends=("gtk-layer-shell: Wayland support")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=("67f86869f1bb845b9a35c56a98084ceaef359656aa689246863d37e5bb2ab231870fa3d3e53f3158ea64a8fd47353ea5429c420fdf3bcca8e5698d4d606781ba")

build() {
    cd ${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
