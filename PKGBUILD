# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
# Contributor: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>

pkgname=g15daemon
pkgver=3.0.1
pkgrel=2
pkgdesc="A daemon that makes it possible to use the G-Buttons and draw on the G15 LCD"
arch=('x86_64')
url="https://gitlab.com/menelkir/g15daemon"
license=('GPL')
depends=('libg15render>=3.0')
source=(https://gitlab.com/menelkir/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('07dd9cdb57065620cf5c27177154a3d8efac359e52c36de0259ba12ae4633b7c900165feb8d21bd2b1a169201e6feb7889d8c9282621a66070789ba8b4f4f0ac')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  echo ""
  echo ""
  echo "You need to install an init script depending on what you're using it."
  echo ""
  echo ""
}
