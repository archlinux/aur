# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-args
pkgname=('python-args' 'python2-args')
pkgver=0.1.0.20121116
_commit=36c727bea812945023968a5bd7b0bdece9ca8666
pkgrel=3
pkgdesc="Command Arguments for Humans"
arch=('any')
license=('BSD')
url="https://github.com/kennethreitz/args"
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-nose' 'python2-nose')
source=("git+https://github.com/kennethreitz/args.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cp -a args{,-py2}
}

build() {
  cd "$srcdir/args"
  python setup.py build

  cd "$srcdir/args-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/args"
  nosetests3

  cd "$srcdir/args-py2"
  nosetests2
}

package_python-args() {
  depends=('python')

  cd args
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-args() {
  depends=('python2')

  cd args-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
