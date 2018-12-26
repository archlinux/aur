# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=contexter
pkgname=("python-${_pkgname}-git" "python2-${_pkgname}-git")
pkgver=v0.1.4.1211337
pkgrel=1
pkgdesc="Contexter: A better contextlib"
arch=('any')
url='https://bitbucket.org/defnull/contexter'
license=('MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
conflicts=("python-$_pkgname")
provides=("python-$_pkgname")
source=('git+https://bitbucket.org/defnull/contexter.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git tag | tail -n 1)-$(git describe --long --always)" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/\n//g'
}

prepare() {
  cd "$srcdir"
  cp -a $_pkgname{,-py2}
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
  
  cd "$srcdir/$_pkgname-py2"
  python2 setup.py build
}

package_python-contexter-git() {
  depends=('python')

  cd "$srcdir/$_pkgname"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

package_python2-contexter-git() {
  depends=('python2')

  cd "$srcdir/$_pkgname"
  python2 setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

