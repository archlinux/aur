# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
pkgver=21.8.0
pkgrel=1
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
depends=(python python-attrs python-hyperlink python-incremental
         python-tubes python-twisted python-werkzeug python-zope-interface)
makedepends=(python-setuptools)
checkdepends=(python-hypothesis python-treq python-pytest)
source=("https://github.com/twisted/klein/archive/$pkgver/klein-$pkgver.tar.gz")
sha512sums=('f0e10e3b92f19dc6b42f071d836b4179af033955fb6a1feb05918c85901741577f8dddc335ead1a4c1181690709abd73bca755c6a7a402d79d7a4bfb196bca58')

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
