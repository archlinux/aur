# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgbase=python-arabic-reshaper
pkgname=('python-arabic-reshaper' 'python2-arabic-reshaper')
pkgver=2.0.15
pkgrel=3
pkgdesc="Reconstruct Arabic sentences to be used in applications that don't support Arabic"
makedepends=('python-setuptools' 'python2-setuptools' 'python-future' 'python2-future' 'python2-configparser')
url="https://github.com/mpcabd/python-arabic-reshaper"
license=('MIT')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('fadcb653c58466eb60bf8f1b4d0afd57')

prepare() {
  cp -a $pkgname-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build

  cd "$srcdir/$pkgname-$pkgver-py2"
  python2 setup.py build
}

package_python-arabic-reshaper() {
  depends=('python' 'python-future' 'python-setuptools')
  provides=('python-arabic-reshaper')
  cd "$srcdir/python-arabic-reshaper-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-arabic-reshaper() {
  depends=('python2' 'python2-configparser' 'python2-future' 'python2-setuptools')
  provides=('python2-arabic-reshaper')
  cd "$srcdir/python-arabic-reshaper-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
