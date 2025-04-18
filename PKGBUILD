# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-importlib-metadata
_name=importlib_metadata
pkgver=2.1.3
pkgrel=3
pkgdesc='Read metadata from Python packages'
arch=('any')
url='https://github.com/python/importlib_metadata'
license=('Apache')
depends=('python2-zipp' 'python2-pathlib2' 'python2-contextlib2'
         'python2-configparser')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('85866f546ea983b94ab6a41e5cba67829b8bd97551883f93b4fa87331ce9a256')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Remove setuptools_scm dependency
  sed -i /scm/d setup.cfg
  sed -i s/use_scm_version=True//g setup.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
