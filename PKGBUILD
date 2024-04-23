# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=pyg3t
pkgver=0.6.0
pkgrel=1
pkgdesc="Python gettext Translation Toolkit"
arch=(any)
url="https://gitlab.com/pyg3t/pyg3t"
license=(GPL-3.0-or-later)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f2eaf64efe844688162ab4497a587ca794f426d51217e4dbb48fdc87caa67546')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

# Workaround for the tests requiring installed scripts (poselect, etc.)
check() {
  cd $pkgname-$pkgver
  python -m installer --destdir='tmp_dir' dist/*.whl
  export PATH="$PWD/tmp_dir/usr/bin:$PATH"
  PYTHONPATH=$PWD python -m pytest -vv
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
