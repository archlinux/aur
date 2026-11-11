# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-spotapi
_name=${pkgname#python-}
pkgver=2.0.0
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
sha512sums=('cd115da8b99b1b4b17a7df7fd2d30a061b733170455a6b2d7bb3022ee01ca43bf94f9276ec9230daab27026b9c401f70466e951c188a16a84166dded01bee075')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
