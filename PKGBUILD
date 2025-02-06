# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="py-mailqueued"
pkgver="0.3.0"
pkgrel="3"
pkgdesc="Queueing daemon for msmtp"
arch=("any")
url="https://github.com/dcbaker/py-mailqueued"
license=("GPLv3")
depends=("python" "python-appdirs" "python-attrs" "python-pydbus")
makedepends=("python-setuptools")
source=(
    "https://github.com/dcbaker/py-mailqueued/archive/${pkgver}.tar.gz"
    "pygobject.patch")
sha256sums=(
    "5b17223d4569d0ee0c700f7e74dc846d259e0e7377da7faf3022a82f2732c0b9"
    "f1d77635163d0235a15a53b913a0d2925a15e7ba299eee2af795b5814da0a47c"
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    patch -Np1 -i "${srcdir}/pygobject.patch"
}

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
