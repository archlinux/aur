pkgname=rbtools
_name=RBTools
pkgver=1.0.2
pkgrel=2
pkgdesc="Client tools for Review Board"
arch=('any')
url="https://www.reviewboard.org/"
license=('custom:MIT')
depends=('python' 'python-setuptools' 'python-six' 'python-tqdm' 'python-texttable' 'python-colorama')
makedepends=('python2-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('577c2f8bbf88f77bda84ee95af0310b59111c156f48a5aab56ca481e2f77eaf4')

build() {
  cd "$srcdir/RBTools-$pkgver"
  find . -type f -exec sed -i 's@#!/usr.*python@#!/usr/bin/python2@' {} \;
  python setup.py build
}

package() {
  cd "$srcdir/RBTools-$pkgver"
  python setup.py install --root "${pkgdir}"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
