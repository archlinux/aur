# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=discover-overlay
pkgver=0.3.3
pkgrel=3
pkgdesc="Yet another Discord overlay for Linux written in Python using GTK3"
arch=("x86_64")
url="https://pypi.org/project/discover-overlay/"
license=("GPL3")
makedepends=("python-setuptools")
depends=("gtk3" "python-gobject" "python-pyxdg" "python-requests" "python-websocket-client" "python-pidfile" "python-cairo" "python-pillow")
conflicts=("discover-overlay-git")
provides=("discover-overlay")
optdepends=("gtk-layer-shell: Wayland support")
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/d/discover-overlay/${pkgname}-${pkgver}.tar.gz")
sha512sums=("1e145b64d1d0ea4d094dc16fc7871d9177604fd72991c06c6067d08bb49c95b8b4e1e84121b61c6393ddd45bb307eb5796c8a83ce708e30ec2a93c9043e971a3")

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
