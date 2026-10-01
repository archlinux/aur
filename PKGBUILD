# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-cloud-texttospeech
pkgname=python-$_name
pkgver=2.38.0
pkgrel=1
pkgdesc='Google Cloud Texttospeech API client library.'
url='https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-texttospeech'
arch=('any')
license=('Apache-2.0')
depends=('python'
         'python-google-api-core'
         'python-grpcio'
         'python-grpcio-status'
         'python-google-auth'
         'python-proto-plus'
         'python-protobuf')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('c9a50f609ae0ccd0465a91029333848011ba713fadf189bdd110ec07c3d22cc1')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect tests/system/smoke_test.py
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
