# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-mimerender
pkgname=(python-mimerender python2-mimerender)
pkgver=0.6.0
pkgrel=3
pkgdesc="Transparently select a render function for an HTTP request handler's result"
arch=('any')
url="https://github.com/martinblech/mimerender"
license=('MIT')
makedepends=('python-mimeparse' 'python2-mimeparse' 'python-setuptools' 'python2-setuptools' 'git')
source=("git+https://github.com/martinblech/mimerender.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cp -a mimerender{,-py2}
}

build() {
  cd "$srcdir"/mimerender
  python setup.py build

  cd "$srcdir"/mimerender-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/mimerender
  python src/test.py

  cd "$srcdir"/mimerender-py2
  python2 src/test.py
}

package_python-mimerender() {
  depends=('python-mimeparse')

  cd mimerender
  python setup.py install -O1 --root "$pkgdir"
}

package_python2-mimerender() {
  depends=('python2-mimeparse')

  cd mimerender-py2
  python2 setup.py install -O1 --root "$pkgdir"
}
