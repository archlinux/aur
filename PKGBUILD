# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

pkgbase=pypy-six
pkgname=('pypy-six' 'pypy3-six')
pkgver=1.12.0
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities (build for pypy)"
arch=('any')
url="http://pypi.python.org/pypi/six/"
license=('MIT')
makedepends=('pypy-setuptools' 'pypy3-setuptools')
source=("https://pypi.io/packages/source/s/six/six-$pkgver.tar.gz")
sha512sums=('937728372edf1e0ac13bbd706723d0de35e015c30d0ae41f789c5ed2e3669bb0db70cdc6e036ec2d437a6c4aa0d5d1e727b6d09ac34cca7e4e92e5d3b4775151')

build() {
  cd $srcdir
  cp -r six-$pkgver six3-$pkgver
}

package_pypy-six() {
  depends=('pypy')
  cd $srcdir/six-$pkgver 
  pypy setup.py install --root "${pkgdir}" --optimize=1 --prefix=/opt/pypy
  install -Dm644 "${srcdir}/six-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_pypy3-six() {
  depends=('pypy3')
  cd $srcdir/six3-$pkgver 
  pypy3 setup.py install --root "${pkgdir}" --optimize=1 --prefix=/opt/pypy3
  install -Dm644 "${srcdir}/six-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
