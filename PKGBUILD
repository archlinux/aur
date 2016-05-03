# Maintainer: Rich Li <rich@dranek.com>
pkgname='python2-cyordereddict'
pkgver=1.0.0
pkgrel=1
pkgdesc="Cython implementation of OrderedDict"
url="https://pypi.python.org/pypi/cyordereddict"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('python2-setuptools' 'cython2')
depends=('python2')
checkdepends=('python2-nose')
#source=(https://pypi.python.org/packages/source/c/cyordereddict/cyordereddict-"$pkgver".tar.gz)
source=(https://github.com/shoyer/cyordereddict/archive/v"$pkgver".tar.gz)
# Note the PyPI and github sources have different checksums. This is because the github version doesn't include the Cython output, but the PyPI does. Since we're using the github source we therefore have Cython as a makedep.
md5sums=('6d3144c6edc4703d7faa62512ccf9db8')
 
build() {
  cd "$srcdir/cyordereddict-$pkgver"
  python2 setup.py build --with-cython
}

check() {
  cd "$srcdir/cyordereddict-$pkgver/build/lib.linux-${CARCH}-2.7"
  nosetests2
}
 
package() {
  cd "$srcdir/cyordereddict-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

  # MIT License
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
