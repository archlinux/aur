# $Id: PKGBUILD 274562 2017-12-16 10:55:46Z arojas $
# Maintainer: aimileus <me at aimileus dot nl>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=phoronix-test-suite
pkgver=8.0.0
pkgrel=2
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux"
arch=('any')
license=('GPL3')
url="http://www.phoronix-test-suite.com/"
depends=('php')
optdepends=('php-gd'
            'sqlite3: required when running a Phoromatic server.'
            'gcc-fortran: required for universe-cli test suite'
            'blas: required for universe-cli test suite'
            'lapack: required for universe-cli test suite'
            'portaudio: required for universe-cli test suite'
            'unzip: required for universe-cli test suite'
            'mesa-demos: required for universe-cli test suite'
            'openmpi: required for universe-cli test suite')
install=${pkgname}.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/phoronix-test-suite/phoronix-test-suite/archive/v${pkgver}.tar.gz")
sha256sums=('1a2352f3dfe37c1201553431bc41a5d8f0839712fe2c6dfc84aa31837ce0656a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  ./install-sh $pkgdir/usr

  rm -r "${pkgdir}"/usr/share/phoronix-test-suite/deploy

  sed -i "s#--noconfirm#--noconfirm --asdeps#" ${pkgdir}/usr/share/phoronix-test-suite/pts-core/external-test-dependencies/scripts/install-arch-packages.sh
  sed -e "s/^export PTS_DIR=.*/export PTS_DIR=\/usr\/share\/phoronix-test-suite/g" -i ${pkgdir}/usr/bin/phoronix-test-suite
}
