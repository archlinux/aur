# Contributor: Johannes Dewender  arch at JonnyJD dot net
_pkgname=pysimplesoap
pkgbase=python-pysimplesoap
pkgname=('python-pysimplesoap' 'python2-pysimplesoap')
pkgver=1.16
pkgrel=1
pkgdesc="Python Simple SOAP Library"
arch=('any')
url="https://github.com/pysimplesoap/pysimplesoap"
license=('LGPL3' 'GPL3' 'Python2')
makedepends=('python' 'python2')
options=(!emptydirs)
source=("https://github.com/pysimplesoap/pysimplesoap/archive/${pkgver}.tar.gz"
'9c062558f14f7045a0ee1d232cee434d917b0d5b.patch')
sha256sums=('68a4fd7b318d8d98d64d224ce4af88bd0fae665f723693d1bd941cebef5c472d'
            'f7570910c18dd7ab0fcf397b18456bfc7326addd0681697d04f601ddbe311948')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p1 < ../9c062558f14f7045a0ee1d232cee434d917b0d5b.patch
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m unittest discover
}

package_python-pysimplesoap() {
  depends=('python')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-pysimplesoap() {
  depends=('python2')
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
