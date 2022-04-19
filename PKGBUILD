#Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=2.0.5
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('e1c278222891acde5d5b47e31b89f765fdf022b8908057f583032530982fe5b4')

prepare() {
  cd $pkgname-release-$pkgver
  sed 's/ICDIFF_OPTIONS $\*"/ICDIFF_OPTIONS" $*/' -i git-icdiff
}

build() {
  cd $pkgname-release-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-release-$pkgver
  python setup.py install -O1 --skip-build --root="$pkgdir"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
