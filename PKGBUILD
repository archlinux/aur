# Maintainer : Felix Yan <felixonmars@archlinux.org>

pkgname=(python-repoze.profile python2-repoze.profile)
pkgver=2.3
pkgrel=1
pkgdesc="Aggregate profiling for WSGI requests"
arch=('any')
license=('custom:BSD')
url="http://docs.repoze.org/profile/"
makedepends=('python-setuptools' 'python2-setuptools' 'pyprof2calltree' 'python2-pyprof2calltree')
checkdepends=('python-nose' 'python2-nose')
source=("https://pypi.io/packages/source/r/repoze.profile/repoze.profile-$pkgver.tar.gz")
md5sums=('65e87b8ef5ac7e6b2074decdb89a180b')

prepare() {
  cp -a repoze.profile-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/repoze.profile-$pkgver
  python setup.py build

  cd "$srcdir"/repoze.profile-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/repoze.profile-$pkgver
  nosetests3

  cd "$srcdir"/repoze.profile-$pkgver-py2
  nosetests2
}

package_python-repoze.profile() {
  depends=('python')
  optdepends=('pyprof2calltree')

  cd repoze.profile-$pkgver
  python setup.py install --root="$pkgdir"
  
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-repoze.profile() {
  depends=('python2-pyprof2calltree')

  cd repoze.profile-$pkgver-py2
  python2 setup.py install --root="$pkgdir"

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
