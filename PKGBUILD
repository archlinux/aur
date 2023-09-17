# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
_base=endpoints
pkgname=python-${_base}
pkgver=6.0.0
pkgrel=1
pkgdesc="Get an api up and running quickly"
arch=(any)
url="https://github.com/jaymon/${_base}"
license=(MIT)
depends=(python-datatypes)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-testdata python-requests) # python-websocket-client python-gevent
optdepends=('python-websocket-client')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('59330141433650dd3270ae8eac4114597d6c8ec36912ac75ca7fda6c51c7b26c55c9ff1ead29718a7cc7e579af595d45e2f61f6152ec7156b9e47d13b1d3e6a8')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   # tests require a Vagrant and pyenv environment
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
