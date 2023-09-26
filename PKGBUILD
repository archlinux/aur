# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>
# Contributor: Sergey Safonov <spoof-arch@spoofa.info>

pkgname=python-lzo
pkgver=1.15
pkgrel=1
pkgdesc="Python bindings for the LZO data compression library"
arch=('x86_64')
url="https://pypi.python.org/pypi/python-lzo"
license=('GPL2')
depends=(python)
makedepends=(lzo python-{build,installer,wheel,setuptools})
checkdepends=(python-pytest)
source=("https://pypi.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a57aaa00c5c3a0515dd9f7426ba2cf601767dc19dc023d8b99d4a13b0a327b49')

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
