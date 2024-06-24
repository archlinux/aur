# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=python-smpplib
pkgver=2.2.3
pkgrel=1
pkgdesc='SMPP (Short Message Peer-to-Peer) library for Python'
url='https://github.com/python-smpplib/python-smpplib'
license=('LGPL-2.1-or-later')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("https://github.com/python-smpplib/python-smpplib/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('58f51dd279779475e313d5a4c16f4fb9125eeafd680f088bbd575ff8b385c3e3')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # tests are also installed for whatever reason, remove them
  rm -rf "$pkgdir/usr/lib/python3.12/site-packages/smpplib/tests/"
}

# vim:set ts=2 sw=2 et:
