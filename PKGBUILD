# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
_base=endpoints
pkgname=python-${_base}
pkgver=9.1.0
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
sha512sums=('702196ae6ba9839ff2141747e48a7c8a59b0931a458d942d660173a4c7ce62d3173978330c7c0c06743f5b488544169fe6960d288ed30f881efdb7e51013f4f9')

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
