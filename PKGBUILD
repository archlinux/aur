# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
_name=${pkgname#python-}
pkgver=0.7.1
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
)
conflicts=("discover-overlay-git")
provides=("discover-overlay")
optdepends=("gtk-layer-shell: Wayland support")
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=("77324ed057964dfcbcefdce13d2a6a4e649a47e0cd88437d299e41925cc80f11f945475651c561d5b9e5beeccbd84e5ee21cfbef2c65c257b86630a1a5937bd4")

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
