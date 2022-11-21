# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ipyvuetify
pkgname=python-$_pkgname
pkgver=1.8.4
pkgrel=1
pkgdesc="Jupyter widgets based on vuetify UI components"
arch=('any')
url="https://pypi.org/project/ipyvuetify"
license=('MIT')
depends=(
    'python-ipyvue'
    'python-pandas'
)
makedepends=(
    'npm'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=('jupyterlab-widgets: to use widgets on Jupyter Lab')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('91d3e61ed24c0b359b8b8009ba957d291af4b204699d6807252de37f9f1e32425be8869417b034620a11f59c31067d261996f9ab9b78f2eef36cbd29bd225f64')

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
