# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=2.0.6
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('8f79b82032696d2eea2a3acf722cd34cf45215d4b09b52139880626a2b0d360e')

prepare() {
  cd $pkgname-release-$pkgver
  sed 's/ICDIFF_OPTIONS $\*"/ICDIFF_OPTIONS" $*/' -i git-icdiff
}

build() {
  cd $pkgname-release-$pkgver
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $pkgname-release-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
