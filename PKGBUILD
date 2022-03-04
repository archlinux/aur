# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
pkgver=0.4.1
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
sha512sums=("29e84ea52758ca699909031244ba1647aafb288cc424dea7299324d601e19d02238b707917f1cf367a178f8dc1aa48fd2c8d2cbe38985d7cc772235facb39c8a")

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
