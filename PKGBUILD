# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=python-croniter
_name=${pkgname#python-}
# https://github.com/kiorky/croniter/blob/master/CHANGELOG.rst
pkgver=3.0.3
pkgrel=1
pkgdesc="A Python module to provide iteration for datetime object."
arch=('any')
url="https://github.com/kiorky/croniter"
license=('MIT')
depends=('python' 'python-dateutil' 'python-pytz')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/kiorky/croniter/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('753950bf489a1d1d41f6052a5754baf6b1a2206b0538fd013a5aaaeb8076f2a1')

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
