# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Igor Nemilentsev <trezorg@gmail.com>
# Contributor: Alexander Diana <alexander@rouk.org>

_name=bcrypt
pkgbase=python-bcrypt
pkgname=("python-bcrypt" "python2-bcrypt")
pkgver=1.1.1
pkgrel=2
pkgdesc="Modern password hashing for your software and your servers"
arch=('i686' 'x86_64')
url="https://github.com/dstufft/bcrypt/"
license=('APACHE')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/b/$_name/$_name-$pkgver.tar.gz")
md5sums=('43c5871c6bc7da1efe6a8bae25f90ad8')


prepare() {
  cp -a "$srcdir/$_name-$pkgver" "$srcdir/$_name-$pkgver-python2"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-python2"
  python2 setup.py build
}

package_python-bcrypt() {
  pkgdesc+=" (for Python 3.x)"
  depends=('python' 'python-cffi' 'python-six')

  cd ${srcdir}/$_name-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -d ${pkgdir}/usr/share/licenses/$pkgname
  install -m 644 "$srcdir/bcrypt-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}

package_python2-bcrypt() {
  pkgdesc+=" (for Python 2.x)"
  depends=('python2' 'python2-cffi' 'python2-six')

  cd ${srcdir}/$_name-${pkgver}-python2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -d ${pkgdir}/usr/share/licenses/$pkgname
  install -m 644 "$srcdir/bcrypt-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}