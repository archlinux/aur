# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

pkgbase=pypy-six
pkgname=('pypy-six' 'pypy3-six')
pkgver=1.10.0
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities (build for pypy)"
arch=('any')
url="http://pypi.python.org/pypi/six/"
license=('MIT')
makedepends=('pypy' 'pypy3')
source=(http://pypi.python.org/packages/source/s/six/six-$pkgver.tar.gz)
md5sums=('34eed507548117b2ab523ab14b2f8b55')

build() {
  cd $srcdir
  cp -r six-$pkgver six3-$pkgver
}

check() {
  cd $srcdir/six-$pkgver 
  pypy setup.py check

  cd $srcdir/six3-$pkgver 
  pypy3 setup.py check
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
