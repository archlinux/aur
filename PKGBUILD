# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ipyvue
pkgname=python-$_pkgname
pkgver=1.9.0
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
b2sums=('301dc530363f417cbb13d50b1960cde3a2492885737aefe2ab3071299ca7cc48d413d144c01b289051d775ff299a109404c0a58945c8de992870b8102a4f73c4')

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
