# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
_name=${pkgname#python-}
_pep625_name=${_name//-/_}
pkgver=0.7.4
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
# Since discover-overlay==0.7.4 package name follow PEP-625,
# as result `-` (hyphen) should be replaced by `_` (underscore) in distribution sdist file.
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_pep625_name}-$pkgver.tar.gz")
sha512sums=("33d39b864d257073262437517fedc0ca23e0c1a3e06f6c96a03dd114b441a34c92c985291bc588926aab91d7ff999de0c8dcf2757d282be7089b1ea95724e8aa")

build() {
    cd ${_pep625_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pep625_name}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
