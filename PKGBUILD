# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>
pkgname=python2-coverage
_name="${pkgname#python2-}py"
pkgver=5.5
pkgrel=3
pkgdesc='A tool for measuring code coverage of Python programs (Python 2)'
arch=('x86_64')
url="https://coverage.readthedocs.io/en/$pkgver/"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-toml: For pyproject.toml support')
_github='https://github.com/nedbat/coveragepy'
source=("$pkgname-$pkgver.tar.gz::$_github/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fa441d7136aba2f08e0ceca2d7646005e7564c536cd628bb0cb0342e0b482562')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Tell setup.py not to create the "coverage" script
  sed -i '/coverage = coverage.cmdline:main/d' setup.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
