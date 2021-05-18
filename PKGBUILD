#Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=2.0.0
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('bce07ff4995aafe9de274ca0a322e56275dc264948b125457d2cc73dd7e9eee2')

prepare() {
  cd $pkgname-release-$pkgver
  sed 's/ICDIFF_OPTIONS $\*"/ICDIFF_OPTIONS" $*/' -i git-icdiff
}

package() {
  cd $pkgname-release-$pkgver

  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md

  for _bin in git-icdiff icdiff; do
    install -Dm755 $_bin "$pkgdir"/usr/bin/$_bin
  done
}
