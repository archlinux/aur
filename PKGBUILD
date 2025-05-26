# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=python-djvulibre-python
_pkgbasename=${pkgname:7}
pkgver=0.9.3
pkgrel=1
pkgdesc='Python interface to DjVuLibre'
license=('GPL-2.0-only')
url='https://github.com/FriedrichFroebel/python-djvulibre'
checkdepends=(djvulibre ghostscript)
makedepends=(python-build python-installer python-wheel python-setuptools djvulibre pkgconf cython)
depends=(python djvulibre)
source=("https://files.pythonhosted.org/packages/source/${_pkgbasename::1}/${_pkgbasename//-/_}/${_pkgbasename//-/_}-$pkgver.tar.gz")
sha256sums=('efe3c816b40b2bf5fda81cced2b44e57e86dfe608cd89e5acfd3596191ed5248')
arch=('x86_64')

_fullsrcdir() {
    echo "${srcdir}/${_pkgbasename/-/_}-${pkgver}"
}

check() {
    cd "$(_fullsrcdir)"
    python setup.py build_ext --inplace  # Build Cython modules
    PYTHONPATH='.:tests' python -m unittest
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
