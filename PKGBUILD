# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Oliver Rümpelein <oli_r@fg4f.de>
# Based upon work of Jeff Parent <jecxjo@sdf.lonestar.org>
_name=pytest-pep8
pkgname=('python-pytest-pep8' 'python2-pytest-pep8')
pkgbase=python-$_name
pkgver=1.0.6
pkgrel=4
pkgdesc="pytest plugin to check PEP8 requirements"
arch=(any)
url="https://bitbucket.org/pytest-dev/pytest-pep8"
license=('MIT')
makedepends=(python-pycodestyle  python-pytest-cache
             python2-pycodestyle python2-pytest-cache) # setuptools included
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('032ef7e5fa3ac30f4458c73e05bb67b0f036a8a5cb418a534b3170f89f120318')

prepare() {
  cp -a $_name-$pkgver{,-py2}
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build

  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py build
}

package_python-pytest-pep8() {
  depends=(python-pycodestyle python-pytest-cache)
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pytest-pep8() {
  depends=(python2-pycodestyle python2-pytest-cache)
  cd "$srcdir/$_name-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
