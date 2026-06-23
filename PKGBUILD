# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-cloud-speech
pkgname=python-$_name
pkgver=2.40.0
pkgrel=1
pkgdesc='Google Cloud Speech API client library.'
arch=('any')
url='https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-speech'
license=('Apache-2.0')
depends=('python' 'python-google-api-core' 'python-grpcio' 'python-grpcio-status' 'python-google-auth' 'python-cryptography' 'python-proto-plus' 'python-protobuf')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e89e688e4ce0b926754038bf992d0d0f065c5f1c3503bb20e6c46d08b63658fc')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    # Need Google Project ID
    --deselect "tests/system/smoke_test.py"
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
