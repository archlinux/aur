# Maintainer: Daniel Milde <daniel@milde.cz>
# Contributer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

pkgbase=pypy-six
pkgname=('pypy-six' 'pypy3-six')
pkgver=1.16.0
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities (build for pypy)"
arch=('any')
url="http://pypi.python.org/pypi/six/"
license=('MIT')
makedepends=('pypy-setuptools' 'pypy3-setuptools')
source=("https://pypi.io/packages/source/s/six/six-$pkgver.tar.gz")
sha512sums=('076fe31c8f03b0b52ff44346759c7dc8317da0972403b84dfe5898179f55acdba6c78827e0f8a53ff20afe8b76432c6fe0d655a75c24259d9acbaa4d9e8015c0')

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
