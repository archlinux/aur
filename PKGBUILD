pkgname=rbtools
verprefix=0.7
pkgver=${verprefix}.9
pkgrel=1
pkgdesc="Client tools for Review Board"
arch=('any')
url="http://www.reviewboard.org/"
license=('custom:MIT')
depends=('python2' 'python2-setuptools' 'python2-six' 'python2-tqdm')
makedepends=('python2-setuptools')
source=(http://downloads.reviewboard.org/releases/RBTools/${verprefix}/RBTools-${pkgver}.tar.gz)
md5sums=('a5d09931efdafac575b36919e7f928e0')

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
