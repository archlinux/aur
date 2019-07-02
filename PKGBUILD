# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=pyroaring
pkgname=('python-pyroaring' 'python2-pyroaring')
pkgbase=python-$_name
pkgver=0.2.7
pkgrel=1
pkgdesc="Fast and lightweight set for unsigned 32 bits integers"
arch=('x86_64')
url="https://pypi.org/pypi/$_name"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('36a45371ddcfc61db3c4180e15cc01da48a8adb4665d0dc08de217bf69973b4a')

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
