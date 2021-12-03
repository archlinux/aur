# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>
pkgname=python-croniter
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="A Python module to provide iteration for datetime object."
arch=('any')
url="https://github.com/kiorky/croniter"
license=('MIT')
depends=('python-dateutil' 'python-natsort')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytz')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4023e4d18ced979332369964351e8f4f608c1f7c763e146b1d740002c4245247')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  pytest src
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 docs/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
