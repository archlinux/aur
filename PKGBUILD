# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ipyvue
pkgname=python-$_pkgname
pkgver=1.11.2
pkgrel=2
pkgdesc="Jupyter widgets base for Vue libraries"
arch=('any')
url="https://pypi.org/project/ipyvue"
license=('MIT')
depends=(
    'jupyterlab'
    'python-ipywidgets'
    'python-watchdog'
)
makedepends=(
    'npm'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=(3b1381bd120184f970a5d66deac33b8592a666c8e1ab7a5afd33ecff342e0a95)

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
