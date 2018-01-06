# $Id: PKGBUILD 274562 2017-12-16 10:55:46Z arojas $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=phoronix-test-suite
pkgver=7.6.0
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=('any')
license=('GPL3')
url="http://www.phoronix-test-suite.com/"
depends=('php')
optdepends=('php-gtk'
	    'php-gd')
install=${pkgname}.install
source=(http://www.phoronix.net/downloads/phoronix-test-suite/releases/phoronix-test-suite-$pkgver.tar.gz)
sha256sums=('c018c27789a696549643335d57fdd3ef9906c17c814f203ca1bef9494fd6e274')

package() {
  cd "$srcdir"/phoronix-test-suite
  sed -i "s#--noconfirm#--noconfirm --asdeps#" pts-core/external-test-dependencies/scripts/install-arch-packages.sh
  install -dm755 "$pkgdir"/usr/share/phoronix-test-suite
  sed -e "s/^export PTS_DIR=.*/export PTS_DIR=\/usr\/share\/phoronix-test-suite/g" -i phoronix-test-suite
  install -Dm755 phoronix-test-suite "$pkgdir"/usr/bin/phoronix-test-suite
  rm -f "$pkgdir"/usr/share/phoronix-test-suite/pts/etc/scripts/package-build-*
  cp -r pts-core/ "$pkgdir"/usr/share/phoronix-test-suite/
}
