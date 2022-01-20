# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: hexchain <i@hexchain.org>
pkgname=python-requirements-parser
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=1
pkgdesc="A Pip requirements file parser."
arch=('any')
url="https://github.com/davidfischer/requirements-parser"
license=('BSD')
depends=('python-future' 'python-setuptools' 'python-types-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz") #{,.asc}
sha256sums=('3336f3a3ae23e06d3f0f88595e4052396e3adf91688787f637e5d2ca1a904069')
#validpgpkeys=('301078D634936CEB7FCDF13BF0C9B0ADA737AB60') # David Fischer <djfische@gmail.com>

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
