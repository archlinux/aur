# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mocket
pkgver=3.13.11
pkgrel=1
pkgdesc="Socket Mock Framework - for all kinds of socket animals, web-clients included - with gevent/asyncio/SSL support"
url="https://github.com/mindflayer/python-mocket"
license=('BSD')
arch=('any')
depends=('python-decorator>=4.0.0' 'python-h11' 'python-typing_extensions' 'python-urllib3')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
: 'checkdepends=(
	'pre-commit'
	'python-psutil'
	'python-pytest'
	'python-pytest-cov'
	'python-asyncio'
	'python-asgiref'
	'python-requests'
	'python-redis'
	'python-gevent'
	'python-sure'
	'python-flake8'
	'python-xxhash'
	'python-httpx'
	'python-requirementslib'
	'python-build'
	'python-fastapi'
	'python-aiohttp'
	'python-wait-for-it'
	'mypy'
	'python-types-decorator'
	'python-types-requests'
	'python-trio'
)'
source=("https://github.com/mindflayer/python-mocket/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2c7a9c4306c235c464a621fa345922a3bcafb18589ef47ca25626668aa9a89baf6bfa327182a211427797a43ae9c1c269e7b256bb5befd310943b63a43fef818')

build() {
  cd python-mocket-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd python-mocket-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/mocket-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
