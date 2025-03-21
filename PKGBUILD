# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pyht
pkgname=python-${_name}
pkgver=0.1.13
pkgrel=1
pkgdesc=" PlayHT Python SDK - AI Text-to-Speech Streaming & Voice Cloning API."
arch=('any')
url='https://github.com/playht/pyht'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('953eb090bd2c6be71f65fa24948f0d4320f041aba5e7193da4eac45d2a6419c7')
depends=('python>=3.8' 'python-grpcio' 'python-filelock' 'python-protobuf' 'python-requests' 'python-aiohttp' 'python-websockets')
makedepends=('python-poetry-core' 'python-grpcio-tools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mock')

prepare(){
  cd "${srcdir}"/${_name}-${pkgver}
  sed -i '/poetry-dynamic-versioning>=1.0.1/d' pyproject.toml
  sed -i '/grpcio-tools==1.58.0/d' pyproject.toml
}

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation --skip-dependency-check
}

# Waiting until Arch maintainers update python-websockets
#check() {
#  local pytest_options=(
#    -vv
#    --override-ini="addopts="
#  )
#  cd "${srcdir}"/${_name}-${pkgver}
#  python -m venv --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest "${pytest_options[@]}" tests
#}

package() {
  cd "${srcdir}"/${_name}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
