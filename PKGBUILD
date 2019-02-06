# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=pyroaring
pkgname=('python-pyroaring' 'python2-pyroaring')
pkgbase=python-$_name
pkgver=0.2.6
pkgrel=1
pkgdesc="A Python dict with a merge() method"
arch=('x86_64')
url="https://pypi.org/pypi/$_name"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e065a765b51725b39c9efe5cf615e587e23582a4ad236f177ed12992325b2308')

prepare() {
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

package_python-pyroaring() {
  depends=('python')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pyroaring() {
  depends=('python2')
  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
