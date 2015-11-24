# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
pkgname=gcdemu
pkgver=3.0.1
pkgrel=1
pkgdesc="GNOME panel applet controlling cdemu-daemon"
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('cdemu-daemon' 'python2' 'python2-gobject' 'python2-notify' 'gtk3')
makedepends=('cmake' 'intltool')
install=gcdemu.install
source=(http://downloads.sourceforge.net/cdemu/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('e5a1905642c08145669c5eb9e65159d5a9a2fbcd1657edd28ae091ee1d02673e56bb7007df2a9f95863cae1a1ab01916bb43b4d10fe054d52507beabd7dd532f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i '1s/python/python2/g' src/gcdemu

  PYTHON=python2 cmake -DPOST_INSTALL_HOOKS=off -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install
}
