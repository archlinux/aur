# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
# Contributor: Ryan Coyner <rcoyner@gmail.com>
pkgname=conkyforecast
pkgver=2.24
pkgrel=1
pkgdesc="Provides weather forecast information to be displayed in conky."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~conky-companions/+junk/conkyforecast"
license=('GPL3')
depends=('python2')
conflicts=('conkyforecast-bzr')
replaces=('conkyforecast-bzr')
install=${pkgname}.install
changelog=${pkgname}.changelog
source=(https://launchpad.net/~conky-companions/+archive/ppa/+files/${pkgname}_${pkgver}.tar.gz)

build() {

  cd ${srcdir}/src
  python2 setup.py build

}

package() {

  cd ${srcdir}/src
  python2 setup.py install --root=${pkgdir}
  install -D -m644 README ${pkgdir}/usr/share/conkyforecast/README
  # Make sure we call python2 to run conkyforecast
  sed -i 's|/usr/bin/python|/usr/bin/python2|' ${pkgdir}/usr/share/conkyforecast/conkyForecast.py
  sed -i 's|/usr/bin/python|/usr/bin/python2|' ${pkgdir}/usr/bin/conkyForecast

}

sha256sums=('251dba60bc209a2f4181de856abb1fe553e8b983d1af40998235061e8679a54d')
