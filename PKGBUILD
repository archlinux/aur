# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-stestr
pkgver=4.0.1
pkgrel=2
pkgdesc="A test runner runner similar to testrepository"
url="https://stestr.readthedocs.io/en/latest/"
license=('Apache')
arch=('any')
depends=('python38-future' 'python38-cliff' 'python38-pbr' 'python38-subunit' 'python38-fixtures'
         'python38-testtools' 'python38-yaml' 'python38-voluptuous')
checkdepends=('python38-hacking' 'python38-sphinx' 'python38-coverage'
              'python38-ddt')
source=("https://pypi.io/packages/source/s/stestr/stestr-$pkgver.tar.gz")
sha512sums=('a74b9278b1941da62af58a087a10e5a0624901ceb81dcdd25eab3a05f003756773551fe6eec46dfb371f7b726cf296abfe0116444fb32c94fb6811440ee22a58')

build() {
  cd stestr-$pkgver
  python3.8 setup.py build
}

check() {
  cd stestr-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  (
    export PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages"
    export PATH="$PWD/tmp_install/usr/bin:$PATH"
    stestr run
  )
}

package() {
  cd stestr-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
