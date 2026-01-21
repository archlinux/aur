# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=2.0.9
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('e6080e24982d749106b42bf62df9ad9010a6f85e557e3dbbe28deb781184167e')

build() {
  cd $pkgname-release-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $pkgname-release-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
