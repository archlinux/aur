# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=p4python
pkgname=(python-p4python python2-p4python)
pkgver=2016.2.1498648
pkgrel=1
pkgdesc="Python interface to Perforce API"
url="https://www.perforce.com/perforce/doc.current/manuals/p4script/03_python.html"
arch=('any')
license=('custom')
source=($pkgname-$pkgver.tar.gz::"https://pypi.python.org/packages/ad/f8/5d31e3b042eee7c8f6e09d482a3816d8b5c2d01a66073d4e48960afdd101/${_pkgsrcname}-${pkgver}.tar.gz")
md5sums=('d958a7501ade5331a6d889689a5dc862')

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
