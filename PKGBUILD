# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-spotapi
_name=${pkgname#python-}
pkgver=1.2.8
pkgrel=1
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
sha512sums=('390ad4d3268c5c22dd8234b503211700388058a97dffe711c74769c644ed92d78cc140b6637846078c26617ba3fbf973711cad8467153449448ca19caaf07190')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
