# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-spotapi
_name=${pkgname#python-}
pkgver=1.2.7
pkgrel=2
pkgdesc="A sleek API wrapper for Spotify's private API"
arch=('any')
url="https://pypi.org/project/spotapi/"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-colorama'
  'python-pillow'
  'python-pyotp'
  'python-readerwriterlock'
  'python-requests'
  'python-tls-client'
  'python-typing_extensions'
  'python-validators'
)
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=(
  'python-pymongo: pymongo extra'
  'python-redis: redis extra'
  'python-websockets: websocket extra'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('132b058a44386109760df57e2b7c1330e79b0bdde69a7c0e608bd0ae0f5870512513108951ab091ea55482e2c77eac0883fe20397618b3c273884742be903520')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
