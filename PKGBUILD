# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-api
pkgname=python-${_name}
pkgver=0.8.2
pkgrel=1
pkgdesc='Python Server API for LiveKit.'
arch=('any')
url='https://github.com/livekit/python-sdks/tree/main/livekit-api'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('dd334266b6c3da1214ae646b4080a5aaba7acf4c216ebf4343a72390c277dec8')
depends=('python>=3.9' 'python-pyjwt' 'python-aiohttp' 'python-protobuf' 'python-types-protobuf' 'python-livekit-protocol')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
