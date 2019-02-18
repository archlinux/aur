# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname=python-klein
pkgver=17.10.0
pkgrel=3
arch=(any)
pkgdesc='A web micro-framework built on werkzeug and twisted.web'
url='https://github.com/twisted/klein'
license=(MIT)
# incremental is listed in both setup_requires and install_requires
depends=(python python-incremental python-six python-twisted python-werkzeug)
makedepends=(python-setuptools python-incremental)
checkdepends=(python-mock python-pytest)
source=("$pkgname-$pkgver.tar.gz::https://github.com/twisted/klein/archive/release-$pkgver.tar.gz")
sha512sums=('611379159d8c06e2e6a63301d6745084f636669043a4acc15334e4ac4b745581a49d83383786e7ddb549b35f6941c9ccd5be35a27372998a6962cb8271eab8dc')

build() {
  cd "$srcdir"/klein-release-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/klein-release-$pkgver
  pytest -v
}

package() {
  cd klein-release-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
