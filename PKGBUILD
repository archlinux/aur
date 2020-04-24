# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="shallow-appify"
pkgver="0.4.2"
pkgrel="1"
pkgdesc="Converts any executable to a non-self-contained mac app bundle which depends on system libraries."
arch=("any")
url="https://github.com/IngoHeimbach/shallow-appify"
license=("MIT")
depends=("python" "python-jinja" "python-pillow")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/shallow-appify/archive/v${pkgver}.tar.gz")
sha256sums=("2a8a8e07f0a4f21900358e8569c0a00bc8292188cdf4cbef4d92f7169e4f1617")

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
