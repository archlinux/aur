# Maintainer: Felix Golatofski <contact@xdfr.de>
pkgname=rbtools
_name=RBTools
pkgver=4.1
pkgrel=1
pkgdesc="Client tools for Review Board"
arch=('any')
url="https://www.reviewboard.org/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-setuptools python-six python-tqdm python-texttable python-colorama pydiffx python-certifi)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('24efb20346b905c9be0464e747ee1bdee7967d1b94175697ea0c830d929475ff')

prepare() {
  cd "$srcdir/RBTools-$pkgver"
}

build() {
  cd "$srcdir/RBTools-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/RBTools-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
