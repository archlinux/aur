# Maintainer: Fabio Loli <loli_fabio@protonmail.com> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=phoronix-test-suite-milestone
pkgver=7.6.0m2
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux, milestone version"
arch=('any')
license=('GPL3')
url="http://www.phoronix-test-suite.com/"
depends=('php')
optdepends=('php-gtk'
            'php-gd'
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
source=(http://www.phoronix-test-suite.com/releases/development/phoronix-test-suite-$pkgver.tar.gz)
sha256sums=('b22b3f4026d877ef87c4089275626b0c2fcc1df7538e9aa6184bdb2e546adae1')

package() {
  cd "$srcdir"/phoronix-test-suite
  sed -i "s#--noconfirm#--noconfirm --asdeps#" pts-core/external-test-dependencies/scripts/install-arch-packages.sh
  install -dm755 "$pkgdir"/usr/share/phoronix-test-suite
  sed -e "s/^export PTS_DIR=.*/export PTS_DIR=\/usr\/share\/phoronix-test-suite/g" -i phoronix-test-suite
  install -Dm755 phoronix-test-suite "$pkgdir"/usr/bin/phoronix-test-suite
  rm -f "$pkgdir"/usr/share/phoronix-test-suite/pts/etc/scripts/package-build-*
  cp -r pts-core/ "$pkgdir"/usr/share/phoronix-test-suite/
}
