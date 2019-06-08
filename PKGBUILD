# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
pkgver=19.6.0
pkgrel=1
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
# incremental is listed in both setup_requires and install_requires
depends=(python python-attrs python-hyperlink python-incremental python-six
         python-tubes python-twisted python-werkzeug python-zope-interface)
makedepends=(python-setuptools python-incremental)
checkdepends=(python-hypothesis python-mock python-treq)
source=("https://github.com/twisted/klein/archive/$pkgver/klein-$pkgver.tar.gz")
sha512sums=('849631f121449556c33a45dcc5b909339730b50f224cd52aadd1e88b1cfe11ef67c03387ef2fc66517d56251001af161b72b518981d36246c741cc381750858f')

prepare() {
  cd klein-$pkgver
  # https://github.com/twisted/klein/pull/286
  sed -i '/"typing"/d' setup.py
}

build() {
  cd klein-$pkgver
  python setup.py build
}

check() {
  cd klein-$pkgver
  PYTHONPATH=src trial3 klein
}

package() {
  cd klein-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
