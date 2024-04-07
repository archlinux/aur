# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
# https://github.com/twisted/klein/blob/trunk/NEWS.rst
pkgver=23.12.0
pkgrel=2
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
depends=(python python-attrs python-hyperlink python-incremental
         python-tubes python-twisted python-werkzeug python-zope-interface
         # Detected by namcap and not declared in setup.py
         python-constantly)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-hypothesis python-treq python-pytest)
source=("https://github.com/twisted/klein/archive/$pkgver/klein-$pkgver.tar.gz")
sha512sums=('c06169a9e619b2f8f60b59e469429f63ceb22a775ef3cf3c688826208d291335e0922ad96b633f71f5e5cf93a05f7ed879b4ca605ee9c593239d54b4dc7d1151')

build() {
  cd klein-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd klein-$pkgver
  pytest src/klein/test
}

package() {
  cd klein-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
