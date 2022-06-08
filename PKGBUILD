# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-yg.lockfile
pkgver=2.3
pkgrel=4
pkgdesc="Lockfile object with timeouts and context manager"
url="https://github.com/yougov/yg.lockfile"
license=('MIT')
arch=('any')
depends=('python-zc.lockfile' 'python-tempora' 'python-jaraco.functools')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest')
source=("https://github.com/yougov/yg.lockfile/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('938bde1795da7d48c11ee01212c0d24179e3b55f17b1a128010ee4304cb6931f87c4fabeccb4637b1cff932253c449c56ea809bd21cc1d131b47ed68e0a9d8af')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd yg.lockfile-$pkgver
  python setup.py build
}

check() {
  cd yg.lockfile-$pkgver
  python -m pytest
}

package() {
  cd yg.lockfile-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  # Will be available in next version
  #install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
