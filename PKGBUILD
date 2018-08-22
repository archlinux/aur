# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
_name=pytest-datafiles
pkgname=('python-pytest-datafiles' 'python2-pytest-datafiles')
pkgbase=python-$_name
pkgver=1.0
pkgrel=1
pkgdesc="py.test plugin to create a 'tmpdir' containing predefined files/directories."
arch=(any)
url="https://github.com/MobileDynasty/pytest-env"
license=('MIT')
makedepends=(python-pytest python2-pytest)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bb6493c00e8cfb26e9a08f3cc6d5796ae1d168a5a3d09a0e31b3c65b5619a4f0')

prepare() {
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

package_python-pytest-datafiles() {
  depends=(python-pytest)
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pytest-datafiles() {
  depends=(python2-pytest)
  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
