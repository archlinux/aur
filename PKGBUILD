# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# Based on python-pytest-localserver in [community]

_name=pytest-localserver
pkgname=python2-$_name
pkgver=0.5.0
pkgrel=3
pkgdesc='py.test plugin to test server connections locally'
arch=('any')
license=('MIT')
url="https://bitbucket.org/pytest-dev/$_name"
depends=('python2-pytest' 'python2-werkzeug')
makedepends=('python2-pytest' 'python2-werkzeug')
checkdepends=('python2-requests')
source=("$pkgname-$pkgver.tar.gz::$url/get/$pkgver.tar.bz2")
sha512sums=('78993ee0245c9eace723c21eee6de359089f1e1895eac9c531268353b3a3d2045006d29656ea99733ad380f33af2b88f7332e83dcd4c7a97ced611cdbce5a673')

prepare() {
  mv pytest-dev-$_name-* $_name-$pkgver
}

build() {
  cd $_name-$pkgver

  python2 setup.py build
}

check() {
  cd $_name-$pkgver

  # Hack entry points by installing it
  python2 setup.py install --root="$PWD/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH" py.test2
}

package() {
  cd $_name-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
