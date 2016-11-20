pkgbase=python-wakeonlan
pkgname=('python-wakeonlan' 'python2-wakeonlan')
pkgver=0.2.2
pkgrel=1
pkgdesc="A small python module for wake on lan"
url="https://github.com/remcohaszing/pywakeonlan"
arch=(any)
license=('WTFPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/26/87/4164f76446fb372ce9ff10f9458ac00dade098ef054772ab3333139e8cfa/wakeonlan-0.2.2.tar.gz")
md5sums=('738cf2e3c01de8ff393d0863f5172383')

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
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-wakeonlan() {
  depends=('python2')

  cd "${srcdir}/wakeonlan-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
  mv ${pkgdir}/usr/bin/wol ${pkgdir}/usr/bin/wol2
}

