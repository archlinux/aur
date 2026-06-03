# Maintainer: hwangsihu

pkgname=python-yandex-music-api
_name=${pkgname#python-}
pkgver=3.0.0
pkgrel=1
pkgdesc="Unofficial Python library for the Yandex.Music API"
arch=('any')
url="https://github.com/MarshalX/yandex-music-api"
license=('LGPL-3.0-only')
depends=('python' 'python-pysocks' 'python-requests' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-aiofiles: async file I/O for async client'
            'python-aiohttp: async client support')
source=("https://github.com/MarshalX/$_name/archive/v$pkgver.tar.gz")
sha256sums=('d3c324bfb319601a9a922848cf805f5ce1da4ae0bdbbc9176c41f444bf5a031a')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  rm -r "$pkgdir"/usr/lib/python*/site-packages/tests

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
  cd "$srcdir/$_name-$pkgver"
  pytest tests
}
