# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-ioflo
pkgname=('python-ioflo' 'python2-ioflo')
pkgver=1.6.0
pkgrel=1
pkgdesc='Flo based programming interface in python'
arch=('any')
url='http://ioflo.com'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python2-enum34' 'git')
checkdepends=('python-nose' 'python2-nose')
source=("git+https://github.com/ioflo/ioflo.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a ioflo{,-py2}
}

build() {
  cd "$srcdir"/ioflo
  python setup.py build

  cd "$srcdir"/ioflo-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/ioflo
  python setup.py nosetests || warning "Tests failed"

  cd "$srcdir"/ioflo-py2
  python2 setup.py nosetests || warning "Tests failed"
}

package_python-ioflo() {
  depends=('python')

  cd ioflo
  python setup.py install --root="$pkgdir" -O1
}

package_python2-ioflo() {
  depends=('python2-enum34')

  cd ioflo-py2
  python2 setup.py install --root="$pkgdir" -O1

  rm "$pkgdir"/usr/bin/ioflo
}
