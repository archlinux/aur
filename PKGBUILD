# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-nose-exclude
pkgname=("python-nose-exclude" "python2-nose-exclude")
pkgver=0.5.0
pkgrel=3
pkgdesc="Exclude specific directories from nosetests runs"
arch=('any')
url="https://github.com/kgrandis/nose-exclude"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'python-nose' 'python2-nose' 'git')
source=("git+https://github.com/kgrandis/nose-exclude.git#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a nose-exclude{,-py2}
}

build() {
  cd "$srcdir"/nose-exclude
  python setup.py build

  cd "$srcdir"/nose-exclude-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/nose-exclude
  python setup.py test

  cd "$srcdir"/nose-exclude-py2
  python2 setup.py test
}

package_python-nose-exclude() {
  depends=('python-nose')

  cd nose-exclude
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-nose-exclude() {
  depends=('python2-nose')

  cd nose-exclude-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
