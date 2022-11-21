# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ipyvue
pkgname=python-$_pkgname
pkgver=1.8.0
pkgrel=1
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
b2sums=('f09d0b76a78d428929c262e1db21fc43bad8752bc7bf9b6cf5862e0d02dcdd5879e363f12200f0c56daff4bdfaedf0088222d5e6b293d7fe35fabb638c16d46c')

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
