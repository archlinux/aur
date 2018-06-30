# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-case
pkgname=('python-case' 'python2-case')
pkgver=1.5.3
_commit=54341e0c8f2e41f0fcaa9d5dc325c33d4746168d
pkgrel=2
pkgdesc="Python unittest Utilities"
arch=('any')
license=('BSD')
url="https://github.com/celery/case"
makedepends=('python-nose' 'python2-nose' 'python2-mock' 'python2-unittest2' 'git')
checkdepends=('python-coverage' 'python2-coverage')
source=("git+https://github.com/celery/case.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cp -a case{,-py2}
}

build() {
  cd "$srcdir"/case
  python setup.py build

  cd "$srcdir"/case-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/case
  nosetests3

  cd "$srcdir"/case-py2
  nosetests2
}

package_python-case() {
  depends=('python-nose')

  cd case
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-case() {
  depends=('python2-nose' 'python2-mock' 'python2-unittest2')

  cd case-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
