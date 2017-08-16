# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=p4python
pkgname=(python-p4python python2-p4python)
pkgver=2017.1.1526044
pkgrel=1
pkgdesc="Python interface to Perforce API"
url="https://www.perforce.com/perforce/doc.current/manuals/p4script/03_python.html"
arch=('any')
license=('custom')
source=($pkgname-$pkgver.tar.gz::"https://pypi.python.org/packages/0c/8f/96d49332fcf60434c92df0d6df4290b3ce930e25a99d7b5acdc131fb2e16/${_pkgsrcname}-${pkgver}.tar.gz")
md5sums=('8d1142270531d98913046380f266be80')

prepare() {
  # Copy folder, so we can cleanly build for both python versions
  mv $_pkgsrcname-$pkgver python-$_pkgsrcname-$pkgver
  cp -rup python-$_pkgsrcname-$pkgver python2-$_pkgsrcname-$pkgver
}

build() {
  # Build for python 3
  cd python-$_pkgsrcname-$pkgver
  python setup.py build

  # Build for python 2
  cd ../python2-$_pkgsrcname-$pkgver
  python2 setup.py build
}

package_python-p4python() {
  depends=('python')
  cd $srcdir/python-$_pkgsrcname-$pkgver
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-p4python() {
  depends=('python2')
  cd $srcdir/python2-$_pkgsrcname-$pkgver
  python2 setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
