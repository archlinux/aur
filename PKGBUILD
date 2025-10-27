# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=livekit-api
pkgname=python-$_name
pkgver=1.0.7
pkgrel=1
pkgdesc='Python Server API for LiveKit.'
arch=('any')
url='https://github.com/livekit/python-sdks/tree/main/livekit-api'
license=('Apache-2.0')
depends=('python>=3.9' 'python-pyjwt' 'python-aiohttp' 'python-protobuf' 'python-livekit-protocol')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f98820d26773c56fb10c72534c98ac1d386b905faa3de8a277251056f2405518')

build() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  PYTHONPATH=$PWD/${_name//-api/} pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
