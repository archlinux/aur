# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="shallow-appify"
pkgver="0.4.3"
pkgrel="1"
pkgdesc="Converts any executable to a non-self-contained mac app bundle which depends on system libraries."
arch=("any")
url="https://github.com/IngoHeimbach/shallow-appify"
license=("MIT")
depends=("python" "python-jinja" "python-pillow")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/shallow-appify/archive/v${pkgver}.tar.gz")
sha256sums=("9f8f7cd9e83d4a48b94b02b234902929fbc49cbcc20b88540c1ec68d768932b2")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    python setup.py install --optimize=1 \
                            --prefix=/usr \
                            --root="${pkgdir}" \
                            --skip-build
}
