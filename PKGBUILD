# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=python-croniter
_name=${pkgname#python-}
# https://github.com/kiorky/croniter/blob/master/CHANGELOG.rst
pkgver=2.0.5
pkgrel=1
pkgdesc="A Python module to provide iteration for datetime object."
arch=('any')
url="https://github.com/kiorky/croniter"
license=('MIT')
depends=('python' 'python-dateutil' 'python-pytz')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/kiorky/croniter/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a98d431cb664ce0d4a7c2cc42b16e27fcb72b1fc11184f9e7263509f3fb6dbe8')

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
