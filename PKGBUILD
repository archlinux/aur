# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pyht
pkgname=python-${_name}
pkgver=0.1.14
pkgrel=1
pkgdesc=" PlayHT Python SDK - AI Text-to-Speech Streaming & Voice Cloning API."
arch=('any')
url='https://github.com/playht/pyht'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8232c0803bf420a37cd7191c17676131b0ca8ba70a5ffca94458e96399efe4f4')
depends=('python' 'python-grpcio' 'python-filelock' 'python-protobuf' 'python-requests' 'python-aiohttp' 'python-websockets')
makedepends=('python-poetry-core' 'python-poetry-dynamic-versioning' 'python-grpcio-tools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mock')

prepare(){
  cd "${srcdir}"/${_name}-${pkgver}
}

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
