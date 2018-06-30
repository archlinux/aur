# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-pytddmon
pkgname=('python-pytddmon' 'python2-pytddmon')
pkgver=1.0.8
_commit=4b2875cfda88050537af58a4103ea8809c27ee1c
pkgrel=3
pkgdesc='Continuous unit testing in Python'
arch=('any')
url='http://pytddmon.org'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-nose' 'python2-nose')
source=("git+https://github.com/objarni/pytddmon.git#commit=$_commit")
md5sums=('SKIP')

prepare() {
  cp -a pytddmon{,-py2}
}

build() {
  cd "$srcdir"/pytddmon
  python setup.py build

  cd "$srcdir"/pytddmon-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/pytddmon
  python setup.py nosetests

  cd "$srcdir"/pytddmon-py2
  python2 setup.py nosetests
}

package_python-pytddmon() {
  depends=('python')

  cd pytddmon
  python setup.py install --root="$pkgdir" -O1
}

package_python2-pytddmon() {
  depends=('python2')

  cd pytddmon-py2
  python2 setup.py install --root="$pkgdir" -O1

  mv "$pkgdir"/usr/bin/pytddmon{,2}.py
}
