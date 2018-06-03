# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=phoronix-test-suite-milestone
pkgver=8.0.0m5
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux, milestone version"
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
provides=('phoronix-test-suite')
conflicts=('phoronix-test-suite' 'phoronix-test-suite-milestone')
install=${pkgname}.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/phoronix-test-suite/phoronix-test-suite/archive/v${pkgver}.tar.gz")
sha256sums=('5763c648a793b21cc91cecc61ec2d3591bd9c2039c2f35d4309b87708a04e4fe')

package() {
  cd "${srcdir}/phoronix-test-suite-${pkgver}"
  ./install-sh $pkgdir/usr

  rm -r "${pkgdir}"/usr/share/phoronix-test-suite/deploy

  sed -i "s#--noconfirm#--noconfirm --asdeps#" pts-core/external-test-dependencies/scripts/install-arch-packages.sh
  sed -e "s/^export PTS_DIR=.*/export PTS_DIR=\/usr\/share\/phoronix-test-suite/g" -i ${pkgdir}/usr/bin/phoronix-test-suite
}
