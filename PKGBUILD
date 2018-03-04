pkgbase=python-wakeonlan
pkgname=('python-wakeonlan' 'python2-wakeonlan')
pkgver=1.0.0
pkgrel=1
pkgdesc="A small python module for wake on lan"
url="https://github.com/remcohaszing/pywakeonlan"
arch=(any)
license=('WTFPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/w/wakeonlan/wakeonlan-${pkgver}.tar.gz")
md5sums=('91e0c97210875915af88ccb9103c866d')

prepare() {
  cd "${srcdir}"/wakeonlan-$pkgver
}

build() {
  cp -r "${srcdir}"/wakeonlan-$pkgver "${srcdir}"/wakeonlan-$pkgver-py2

  cd "${srcdir}"/wakeonlan-$pkgver
  python setup.py build

  cd "${srcdir}"/wakeonlan-$pkgver-py2
  python2 setup.py build
}

package_python-wakeonlan() {
  depends=('python')

  cd "${srcdir}/wakeonlan-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-wakeonlan() {
  depends=('python2')

  cd "${srcdir}/wakeonlan-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/wakeonlan "${pkgdir}"/usr/bin/wakeonlan2
}

