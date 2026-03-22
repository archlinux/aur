# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=2.0.10
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('0db463ddf9006c671170022cae2ce6ef101b0da6329ab59ae90a534ef57fea5e')

build() {
  cd $pkgname-release-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $pkgname-release-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
