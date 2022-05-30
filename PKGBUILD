# Maintainer: Felix Golatofski <contact@xdfr.de>
pkgname=rbtools
_name=RBTools
pkgver=3.1
pkgrel=2
pkgdesc="Client tools for Review Board"
arch=('any')
url="https://www.reviewboard.org/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-setuptools python-six python-tqdm python-texttable python-colorama pydiffx)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz
  0001-Fix-applying-patches-in-Mercurial.patch)
sha256sums=('a185dd9c4b42eeda6b611135b3a814cc01c9b870519a3b6d6d7e7401592692f9'
            '33f40caa1734e8248b3d91697c279b9b3f285b34dcda077f4d3be0532d61c1b7')

prepare() {
  cd "$srcdir/RBTools-$pkgver"
  patch -Np1 -i ../0001-Fix-applying-patches-in-Mercurial.patch
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
