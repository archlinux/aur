# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=djvulibre-python
_pkgbasename=${pkgname}
pkgver=0.9.1
pkgrel=1
pkgdesc='Python interface to DjVuLibre'
license=('GPL-2.0-only')
url='https://github.com/FriedrichFroebel/python-djvulibre'
# checkdepends=(python djvulibre ghostscript)
makedepends=(python-build python-installer python-wheel python-setuptools djvulibre pkgconf)
depends=(python djvulibre cython)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename//-/_}/${_pkgbasename//-/_}-$pkgver.tar.gz")
sha256sums=('a060b076382cb5d13eb8f4eaff4f6200b8cce4ebe7527a66686e0e1cf3b54ba5')
arch=('x86_64')

_fullsrcdir() {
    echo "${srcdir}/${_pkgbasename/-/_}-${pkgver}"
}

# TODO: Make sure the tests run
# check() {
#     cd "$(_fullsrcdir)"
#     python -m unittest
# }

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
