# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=gshogi
pkgver=0.5.1
pkgrel=2
pkgdesc="A program to play Shogi (Japanese Chess)"
arch=('i686' 'x86_64' 'aarch64')
url="https://johncheetham.com/projects/${pkgname}/index.html"
license=('GPL-3.0-only')
depends=('python3' 'python-cairo' 'gtk3' 'gdk-pixbuf2' 'python-gobject')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/johncheetham/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6ac2bbb353edfd760938101a674480f42c6dd4b72c364a214417a83a6c9396d1')

prepare() {
    # removing the deprecated ez_setup:

    # 1) remove ez_setup.py entirely:
    rm "${srcdir}/${pkgname}-${pkgver}/ez_setup.py"

    # 2) remove the first two lines from the main setup script that reference the ez_setup.py:
    sed -i '1,2d' "${srcdir}/${pkgname}-${pkgver}/setup.py"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}"
}
