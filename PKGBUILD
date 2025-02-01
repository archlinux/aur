# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-api
pkgname=python-${_name}
pkgver=0.8.1
pkgrel=2
pkgdesc='Access LiveKit server APIs and generate access tokens.'
arch=('any')
url='https://github.com/livekit/python-sdks/tree/main/livekit-api'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('4cf491b575f059389c55139c7940f63e2f80a90a41326924d8703adec02bd76d')
depends=('python>=3.7' 'python-pyjwt' 'python-aiohttp' 'python-protobuf' 'python-types-protobuf' 'python-livekit-protocol')
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
