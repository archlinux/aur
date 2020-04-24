# Maintainer: Ingo Heimbach <i.heimbach@fz-juelich.de>

pkgname="shallow-appify"
pkgver="0.4.1"
pkgrel="1"
pkgdesc="Converts any executable to a non-self-contained mac app bundle which depends on system libraries."
arch=("any")
url="https://github.com/IngoHeimbach/shallow-appify"
license=("MIT")
depends=("python" "python-jinja" "python-pillow")
makedepends=("python-setuptools")
source=("https://github.com/IngoHeimbach/shallow-appify/archive/v${pkgver}.tar.gz")
sha256sums=("1f0dc5fa855c7b171d1c94a4d39558a3371489ac8be79dc1cab8ae29f2576be3")

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
