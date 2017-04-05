# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>

pkgbase=python-editor
pkgname=('python-editor' 'python2-editor')
pkgver=1.0.3
pkgrel=1
pkgdesc="Programmatically open an editor, capture the result"
arch=('any')
url="https://github.com/fmoo/python-editor"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fmoo/python-editor/archive/$pkgver.tar.gz")
sha256sums=('e627a2160bdf5e435dcde964cf38bae39c02cdd8da2ccf5fac313b2ca453e2a3')

prepare() {
  cp -a $pkgbase-$pkgver{,-py2}
  sed -i 's/python/python2/' $pkgbase-$pkgver-py2/editor.py
}

build() {
  cd "$srcdir"/$pkgbase-$pkgver
  python setup.py build

  cd "$srcdir"/$pkgbase-$pkgver-py2
  python2 setup.py build
}

package_python-editor() {
  depends=('python')

  cd $pkgbase-$pkgver
  python setup.py install --root="$pkgdir" --skip-build
}

package_python2-editor() {
  depends=('python2')

  cd $pkgbase-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --skip-build
}
