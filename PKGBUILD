# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>
# Contributor: Sergey Safonov <spoof-arch@spoofa.info>

pkgname=python-lzo
pkgver=1.14
pkgrel=2
pkgdesc="Python bindings for the LZO data compression library"
arch=('x86_64')
url="https://pypi.python.org/pypi/python-lzo"
license=('GPL2')
depends=(python)
makedepends=(lzo python-{build,installer,wheel,setuptools})
checkdepends=(python-nose)
source=("https://pypi.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('83cbd8ecaae284735250e31d6c0ecc18ac08763fab2a8c910dc5a6910db6250c')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check()  {
  cd "$pkgname-$pkgver"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  PYTHONPATH="$PWD:$PWD/build/lib.linux-$CARCH-cpython-${python_version}" nosetests
}
