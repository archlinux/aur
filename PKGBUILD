# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>
# Contributor: Sergey Safonov <spoof-arch@spoofa.info>

pkgname=python-lzo
pkgver=1.16
pkgrel=1
pkgdesc="Python bindings for the LZO data compression library"
arch=('x86_64')
url="https://pypi.python.org/pypi/python-lzo"
license=('GPL2')
depends=(python)
makedepends=(lzo python-{build,installer,wheel,setuptools})
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::https://github.com/jd-boyd/python-lzo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('81542d191c6a3f81bd8f04e75a12107ef8197c35e5b7b54c11773910fd56a065')

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

  PYTHONPATH="$PWD:$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest tests
}
