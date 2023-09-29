# Submitter: Kevin Majewski <kevin.majewski02@gmail.com>
# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay-git
pkgver=v0.6.9.r1.gdaa716c
pkgrel=1
pkgdesc="Yet another Discord overlay for Linux written in Python using GTK3"
arch=("x86_64")
url="https://github.com/trigg/Discover"
license=("GPL3")
makedepends=(
    "git"
    "python-build"
    "python-wheel"
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
source=("${pkgname}::git+${url}.git")
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
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
