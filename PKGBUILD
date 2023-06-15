# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>
pkgname=python-croniter
_name=${pkgname#python-}
pkgver=1.4.0
pkgrel=1
pkgdesc="A Python module to provide iteration for datetime object."
arch=('any')
url="https://github.com/kiorky/croniter"
license=('MIT')
depends=('python-dateutil' 'python-natsort')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytz')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('edf332f2ef3b2b47d4c01004c640981c5a70d8ccb6b854aea8866a28b532449a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest src
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
