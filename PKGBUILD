# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="shallow-appify"
pkgver="0.4.4"
pkgrel="1"
pkgdesc="Converts any executable to a non-self-contained mac app bundle which depends on system libraries."
arch=("any")
url="https://github.com/IngoHeimbach/shallow-appify"
license=("MIT")
depends=("python" "python-jinja" "python-pillow")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/shallow-appify/archive/v${pkgver}.tar.gz")
sha256sums=("720f7f02d7b00e54bb8ccf2dd260380ea18ce4217cdf28520b425f24fc13844b")

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
