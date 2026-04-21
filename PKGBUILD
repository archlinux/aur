# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.0.4'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='myloginpath'

pkgname="python-${_pypi_package}"
pkgver="0.0.4"
pkgrel=1
pkgdesc="MySQL login path file reader"
arch=('any')
url='https://github.com/PyMySQL/myloginpath/'
license=('MIT')
depends=('python' 'python-cryptography')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('c44b8d11e8f35a02eeac4b88bf244203c09cc496bfa19ce99a79561c038f9d09')

build() {
  cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
