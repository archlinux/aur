# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-api
pkgname=python-$_name
pkgver=1.1.0
pkgrel=1
pkgdesc='Python Server API for LiveKit.'
arch=('any')
url='https://github.com/livekit/python-sdks/tree/main/livekit-api'
license=('Apache-2.0')
depends=('python' 'python-pyjwt' 'python-aiohttp' 'python-protobuf' 'python-livekit-protocol')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f94c000534d3a9b506e6aed2f35eb88db1b23bdea33bb322f0144c4e9f73934e')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD/${_name//-api/} pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
