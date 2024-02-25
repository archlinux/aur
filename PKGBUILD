# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-uni-curses
_name=unicurses
pkgver=2.1.7
pkgrel=1
pkgdesc="Unified Curses Wrapper for Python"
arch=('any')
url="https://github.com/unicurses/unicurses"
license=('GPL-3.0-or-later')
depends=('ncurses' 'python' 'python-x256')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('f7c7529a8cea86842cc9fa8601ad5b22c9acb10e9bea5b5f4822c249dcaefd50')

prepare() {
  cd "$_name-v.$pkgver"

  # Don't package Windows binaries
  sed -i '/package_data/d' setup.py
}

build() {
  cd "$_name-v.$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-v.$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
