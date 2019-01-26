# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgbase=python-klein
pkgname=(python-klein python2-klein)
pkgver=17.10.0
pkgrel=2
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
makedepends=(python-setuptools python-incremental python-six python-twisted python-werkzeug
             python2-setuptools python2-incremental python2-six python2-twisted python2-werkzeug)
checkdepends=(python-mock python-pytest python2-mock python2-pytest)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/twisted/klein/archive/release-$pkgver.tar.gz")
sha512sums=('611379159d8c06e2e6a63301d6745084f636669043a4acc15334e4ac4b745581a49d83383786e7ddb549b35f6941c9ccd5be35a27372998a6962cb8271eab8dc')

prepare() {
  cp -a klein-release-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/klein-release-$pkgver
  python setup.py build

  cd "$srcdir"/klein-release-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/klein-release-$pkgver
  pytest -v

  cd "$srcdir"/klein-release-$pkgver-py2
  pytest2 -v
}

package_python-klein() {
  depends=(python-incremental python-six python-twisted python-werkzeug)

  cd klein-release-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_python2-klein() {
  depends=(python2-incremental python2-six python2-twisted python2-werkzeug)

  cd klein-release-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
