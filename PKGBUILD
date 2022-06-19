# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=ipyvuetify
pkgname=python-$_pkgname
pkgver=1.8.2
pkgrel=1
pkgdesc="Jupyter widgets based on vuetify UI components"
arch=('any')
url="https://github.com/widgetti/ipyvuetify"
license=('MIT')
depends=('jupyterlab' 'python-jupyter_core' 'python-pandas')
makedepends=('npm' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}::https://github.com/widgetti/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('e3e6d17ef7983f956435d8e71081c8eacafe4b4eaa5cf954cda7288514e92fd02232a037e8ab009d725be73932aa3d34940438db69562a66163916ca4f2c67bb')

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
