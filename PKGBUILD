#Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=1.9.4
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('dabceff1986d45f1e0e6a396ed71836586acfb99092a91303f14052b879ca59a')

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
