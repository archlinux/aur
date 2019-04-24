# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgbase=python-arabic-reshaper
pkgname=('python-arabic-reshaper' 'python2-arabic-reshaper')
pkgver=2.0.14
pkgrel=3
pkgdesc="Reconstruct Arabic sentences to be used in applications that don't support Arabic"
makedepends=('python-setuptools' 'python2-setuptools' 'python-future' 'python2-future' 'python2-configparser')
url="https://github.com/mpcabd/python-arabic-reshaper"
license=('GPL3')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('96c0bf23cbf5396f2bb8e564f4b90739')

prepare() {
  cp -a $pkgname-$pkgver{,-py2}

  # remove configparser requirement for python3
  sed -i "s/'configparser', //" $srcdir/$pkgname-$pkgver/setup.py
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
}

package_python2-arabic-reshaper() {
  depends=('python2' 'python2-configparser' 'python2-future' 'python2-setuptools')
  provides=('python2-arabic-reshaper')
  cd "$srcdir/python-arabic-reshaper-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
