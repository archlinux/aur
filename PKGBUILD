# $Id: PKGBUILD 171328 2016-04-18 11:00:47Z kkeen $
# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgbase=python-path
pkgname=(python-path python2-path)
pkgver=10.1
pkgrel=1
pkgdesc="Aka path.py, implements path objects as first-class entities"
arch=('any')
url="https://pypi.python.org/pypi/path.py"
license=('MIT')
depends=('python' 'python-setuptools')
makedepends=('python-setuptools' 'python2-setuptools')
#source=("https://pypi.python.org/packages/source/p/path.py/path.py-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/p/path.py/path.py-$pkgver.tar.gz")
md5sums=('f9d31317ceeb798f6b5eac8d3b8e5988')

# formerly a dependency of python-pickleshare
# now used by nothing so back to the AUR

prepare() {
  cd "$srcdir"
  cp -r path.py-$pkgver python2-path.py-$pkgver
}

package_python-path() {
  depends=('python' 'python-setuptools')
  cd "$srcdir/path.py-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  head -n 21 path.py > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

package_python2-path() {
  depends=('python2' 'python2-setuptools')
  cd "$srcdir/python2-path.py-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  head -n 21 path.py > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
