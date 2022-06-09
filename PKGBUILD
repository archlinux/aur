# Submitter: Kevin Majewski <kevin.majewski02@gmail.com>
# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay-git
pkgver=v0.5.3.r1.gc9790a6
pkgrel=1
pkgdesc="Yet another Discord overlay for Linux written in Python using GTK3"
arch=("x86_64")
url="https://github.com/trigg/Discover"
license=("GPL3")
makedepends=(
    "git"
    "python-setuptools"
)
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
    "dbus-python"
)
conflicts=("discover-overlay")
provides=("discover-overlay")
optdepends=("gtk-layer-shell: Wayland support")
source=("${pkgname}::git+https://github.com/trigg/Discover.git")
sha512sums=("SKIP")


pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
    cd "${srcdir}/${pkgname}"
    python -B setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
    export PYTHONHASHSEED=0
    python -B setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
