#Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=2.0.4
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('ec21632b64159990a1bcedc8b25f96b476e7a6d9e18b75422420c0ae9b694eac')

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
