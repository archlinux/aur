# Submitter: Kevin Majewski <kevin.majewski02@gmail.com>
# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay-git
pkgver=v0.6.5.r17.ga1fa03d
pkgrel=1
pkgdesc="Yet another Discord overlay for Linux written in Python using GTK3"
arch=("x86_64")
url="https://github.com/trigg/Discover"
license=("GPL3")
makedepends=(
    "git"
    "python-build"
    "python-installer"
)
depends=(
    "gtk3"
    "python-gobject"
    "python-pyxdg"
    "python-requests"
    "python-websocket-client"
    "python-cairo"
    "python-pillow"
    "python-xlib"
    "python-setuptools"
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

    python -B -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"

    python -B -m installer --destdir="${pkgdir}" dist/*.whl

    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
