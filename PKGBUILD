# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=phoronix-test-suite-milestone
pkgver=8.0.0m3
pkgrel=2
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
#source=(http://www.phoronix-test-suite.com/releases/development/phoronix-test-suite-$pkgver.tar.gz)
_commit=c0d5d1573c53d8a42e5286d52d60bf3a881bf045 # 8.0.0m3
source=("$pkgname-$pkgver.tar.gz::https://github.com/phoronix-test-suite/phoronix-test-suite/archive/$_commit.tar.gz")
sha256sums=('70cf0406ad15f8001001f2fdc10b0a961e7d25463d34cb810440c5992be446c3')

package() {
  cd "${srcdir}/phoronix-test-suite-${_commit}"
  ./install-sh $pkgdir/usr

  rm -r "${pkgdir}"/usr/share/phoronix-test-suite/deploy

  sed -i "s#--noconfirm#--noconfirm --asdeps#" pts-core/external-test-dependencies/scripts/install-arch-packages.sh
  sed -e "s/^export PTS_DIR=.*/export PTS_DIR=\/usr\/share\/phoronix-test-suite/g" -i ${pkgdir}/usr/bin/phoronix-test-suite
}
