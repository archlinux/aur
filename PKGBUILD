# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=python-pycapnp
_pkgname=pycapnp
pkgver=1.0.0b1
pkgrel=1
pkgdesc="cython wrapping of the C++ Cap'n Proto serialization library"
arch=(x86_64)
url=https://pypi.python.org/pypi/pycapnp
license=(BSD)
depends=(python capnproto)
makedepends=(python-setuptools cython)
checkdepends=(python-pytest)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/capnproto/pycapnp/archive/v${pkgver}.tar.gz")
sha256sums=('89f87f101305135ba129d076e060b0071c0fc7b99a9e7063c544426e7e966faf')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
