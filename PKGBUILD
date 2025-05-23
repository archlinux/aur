# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='1.0.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='jalali-core'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A Gregorian to Jalali and inverse date convertor"
arch=('any')
url='https://github.com/slashmili/jalali-core'
license=('LGPL-2.1')
depends=('python')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('f4287c70c630323dcf0a3ab26df905ba4d451e230ac1f65b3bb2f77797894a2b')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
