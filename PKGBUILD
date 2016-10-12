# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
pkgname=gcdemu
pkgver=3.0.3
pkgrel=1
pkgdesc="GNOME panel applet controlling cdemu-daemon"
arch=('i686' 'x86_64')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('cdemu-daemon' 'python2' 'python2-gobject' 'python2-notify' 'gtk3')
makedepends=('cmake' 'intltool')
source=(http://downloads.sourceforge.net/cdemu/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('e2d6a9a4d08f5698aba11031aa6eaf8c6007aaeaa953c781d9923255fc4c5f8db00137ebb4d89eca69836ad880066019c0a4bc1d6bc80904dcf31dae7f486410')

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
