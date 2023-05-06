# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
# https://github.com/twisted/klein/blob/trunk/NEWS.rst
pkgver=23.5.0
pkgrel=1
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
depends=(python python-attrs python-hyperlink python-incremental
         python-tubes python-twisted python-werkzeug python-zope-interface
         # Detected by namcap and not declared in setup.py
         python-constantly)
makedepends=(python-setuptools)
checkdepends=(python-hypothesis python-treq python-pytest)
source=("https://github.com/twisted/klein/archive/$pkgver/klein-$pkgver.tar.gz")
sha512sums=('ebfd50989bec653cb0997d5d58cd9071e1bd1690566f1892ca3a04511dfe1a64dc790859d955d69aa1757f77f049278bd628025fc2b596d153b7208d3007f0bc')

build() {
  cd klein-$pkgver
  python setup.py build
}

check() {
  cd klein-$pkgver
  pytest src/klein/test
}

package() {
  cd klein-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
