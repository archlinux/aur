# Contributor: Gleb Liutsko <gleb290303@gmail.com>

pkgname=python-yandex-music-api
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=2
pkgdesc="Unofficial Python library for the Yandex.Music API"
arch=('any')
url="https://github.com/MarshalX/yandex-music-api"
license=('LGPL3')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/MarshalX/$_name/archive/v$pkgver.tar.gz")
md5sums=('3fc0b3af5dafdcd304f4eb072e8894e1')

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
