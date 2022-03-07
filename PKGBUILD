# Contributor: Gleb Liutsko <gleb290303@gmail.com>

pkgname=python-yandex-music-api
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Unofficial Python library for the Yandex.Music API"
arch=('any')
url="https://github.com/MarshalX/yandex-music-api"
license=('LGPL3')
depends=('python' 'python-requests' 'python-aiohttp' 'python-aiofiles')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/MarshalX/$_name/archive/v$pkgver.tar.gz")
md5sums=('bdc737cd48b827345a8c157b9c79794e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  rm $pkgdir/usr/lib/python*/site-packages/tests -r
}

check() {
  cd $srcdir/$_name-$pkgver

  pytest tests
}
