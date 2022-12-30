# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-uni-curses
_name=Uni-Curses
pkgver=2.1.3
pkgrel=1
pkgdesc="Unified Curses Wrapper for Python"
arch=('any')
url="https://github.com/unicurses/unicurses"
license=('GPL3')
depends=('ncurses' 'python' 'python-x256')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bb34a21748c06732348999e033f1ae27ad28f946cb4395d0cf27133e2b68df8c')

prepare() {
  cd "$_name-$pkgver"

  # Don't package Windows binaries
  sed -i '/package_data/d' setup.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
