# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Schönfelder <passtschu at freenet dot de>
# https://github.com/FabioLolix

pkgname=phoronix-test-suite-milestone
pkgver=7.4.0m4
pkgrel=1
pkgdesc="The most comprehensive testing and benchmarking platform available for Linux, milestone version"
arch=('any')
license=('GPL3')
url="http://www.phoronix-test-suite.com/"
depends=('php')
optdepends=('php-gtk'
            'php-gd'
            'gcc-fortran')
provides=('phoronix-test-suite')
conflicts=('phoronix-test-suite' 'phoronix-test-suite-milestone')
install=${pkgname}.install
source=(http://www.phoronix-test-suite.com/releases/development/phoronix-test-suite-$pkgver.tar.gz)
sha256sums=('98beda0efe54c9384b7e8a2c9231680496a39bd05dbc9fbd977d572ab420cee1')

package() {
  cd "$srcdir"/phoronix-test-suite
  sed -i "s#--noconfirm#--noconfirm --asdeps#" pts-core/external-test-dependencies/scripts/install-arch-packages.sh
  install -dm755 "$pkgdir"/usr/share/phoronix-test-suite
  sed -e "s/^export PTS_DIR=.*/export PTS_DIR=\/usr\/share\/phoronix-test-suite/g" -i phoronix-test-suite
  install -Dm755 phoronix-test-suite "$pkgdir"/usr/bin/phoronix-test-suite
  rm -f "$pkgdir"/usr/share/phoronix-test-suite/pts/etc/scripts/package-build-*
  cp -r pts-core/ "$pkgdir"/usr/share/phoronix-test-suite/
}
