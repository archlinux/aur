# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Dan Serban
# Contributor: Richard Murri

# Based on python-werkzeug in [community]

_name=werkzeug
pkgname=python2-$_name
pkgver=1.0.1
pkgrel=1
pkgdesc='Swiss Army knife of Python web development'
url='http://werkzeug.pocoo.org/'
arch=('any')
license=('custom:BSD')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-timeout' 'python2-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets/$_name/archive/$pkgver.tar.gz")
sha512sums=('ba82120fb3e96e3a1334c6452d5ba1950fc016d2d147d643bbc2168ccec496f1dea799982ae8c578167155082c0bdbda5d56a23f64b4b6865f97e90e22df022e')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_name-$pkgver"

  PYTHONPATH="$PWD/build/lib" pytest2
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
