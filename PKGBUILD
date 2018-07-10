pkgname=rbtools
_name=RBTools
pkgver=1.0
pkgrel=1
pkgdesc="Client tools for Review Board"
arch=('any')
url="http://www.reviewboard.org/"
license=('custom:MIT')
depends=('python2' 'python2-setuptools' 'python2-six' 'python2-tqdm' 'python2-texttable' 'python2-colorama' 'python2-backports.shutil_get_terminal_size')
makedepends=('python2-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('c45fd2c54438ebf9c5c14c1cddd4b5a526bb60d998e8217de6cc50baec925883')

build() {
  cd "$srcdir/RBTools-$pkgver"
  find . -type f -exec sed -i 's@#!/usr.*python@#!/usr/bin/python2@' {} \;
  export PYTHON=python2
  python2 setup.py build || return 1
}

package() {
  cd "$srcdir/RBTools-$pkgver"
  python2 setup.py install --root "${pkgdir}" || return 1
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
