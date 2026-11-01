# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_rawname=py65
_pkgbase="python-${_rawname}"
pkgname="${_pkgbase}"
pkgver=1.2.0
pkgrel=1
pkgdesc="Emulate 6502-based microcomputer systems in Python"
arch=('any')
url="https://github.com/mnaberez/${_rawname}"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=("${_pkgbase}-git")

source=("${_rawname}-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bd84a61f71bcb64c033114657c77bb62a0265244c8f3d2b4b8d37e30ee18bf6d')

build() {
  cd "${_rawname}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_rawname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

