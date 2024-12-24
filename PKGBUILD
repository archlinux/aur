# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-func-timeout
epoch=1
pkgver=4.3.6
pkgrel=2
pkgdesc="Python module which allows you to specify timeouts when calling any existing function. Also provides support for stoppable-threads"
url="https://github.com/kata198/func_timeout"
license=('LGPL')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kata198/func_timeout/archive/$pkgver.tar.gz")
sha512sums=('4f50ab5ee23d5c8ba721dfeee866a38857ea94c12a1032a977fef63bdbf4e63bf0cfdf6912d26358f78834ab81e2bf2b1cd9c487ba1f9141af08bb97538f9db4')

build() {
  cd func_timeout-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd func_timeout-$pkgver
  python testit.py
}

package() {
  cd func_timeout-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
