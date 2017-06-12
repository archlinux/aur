# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
pkgname=gcdemu
pkgver=3.1.0
pkgrel=1
pkgdesc="GNOME panel applet controlling cdemu-daemon"
arch=('any')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('cdemu-daemon' 'python2' 'python2-gobject' 'python2-notify' 'gtk3')
makedepends=('cmake' 'intltool')
source=(http://downloads.sourceforge.net/cdemu/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('e3e0369cc443bc47befa52989cc2bc5d62e4c9462bb8de1c3dd8563e1240ba7f59fc8cc54aed2e96bdb23a5f6e2fa11ca36073dfa066409f097a1dca619866fc')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i '1s/python/python2/g' src/gcdemu
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PYTHON=python2 cmake -DPOST_INSTALL_HOOKS=off -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR=${pkgdir} install
}
