# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
pkgname=('python-astropy-helpers' 'python2-astropy-helpers')
pkgver=1.0.2
pkgrel=1
pkgdesc="Utilities used for building the Astropy python library for astronomy"
arch=('any')
url="https://github.com/astropy/astropy-helpers"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/a/astropy-helpers/astropy-helpers-${pkgver}.tar.gz")
md5sums=('2b0e971ec0843e78816d745a27f5dead')

build() {
  cp -r ${srcdir}/astropy-helpers-${pkgver} ${srcdir}/astropy-helpers-${pkgver}-py2

  cd ${srcdir}/astropy-helpers-${pkgver}
  python setup.py build --use-system-libraries

  cd ${srcdir}/astropy-helpers-${pkgver}-py2
  python2 setup.py build --use-system-libraries
}

package_python-astropy-helpers() {
  cd ${srcdir}/astropy-helpers-${pkgver}
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
  python setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-astropy-helpers() {
  cd ${srcdir}/astropy-helpers-${pkgver}-py2
  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
