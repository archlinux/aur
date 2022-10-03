# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ipyvue
pkgname=python-$_pkgname
pkgver=1.7.0
pkgrel=1
pkgdesc="Jupyter widgets base for Vue libraries"
arch=('any')
url="https://github.com/widgetti/ipyvue"
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/widgetti/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('81ede22832ef575fefef4fa9f4763a610bef9818f5063464299c752fe7850436ef8fb324aafa3ddefa63662d9eba31decc20a3c3d3fd1f4dcf72de8530063450')

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
