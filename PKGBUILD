# $Id: PKGBUILD 147012 2012-01-20 18:44:12Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Russian bepo: Vincent Bernardoff <vbmithr@gmail.com>

pkgname=xkeyboard-config-rub
pkgver=2.5
pkgrel=1
pkgdesc="X keyboard configuration files with russian bepo layout patch"
arch=(any)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
depends=('xorg-xkbcomp')
makedepends=('intltool')
provides=('xkeyboard-config' 'xkbdata')
replaces=('xkeyboard-config' 'xkbdata')
conflicts=('xkeyboard-config' 'xkbdata')
source=(http://xorg.freedesktop.org/archive/individual/data/${pkgname/-rub/}-${pkgver}.tar.bz2 russian_bepo.patch)
sha256sums=('0f50579d34e56d817a1bf7ff26582984dd7262209e9e74862237cfae5a7a2961' 'f3eaa89367d6b97baf547387b5863f60152a907d9a168b5a379c0b57df0c9ebb')

build() {
  cd "${srcdir}/${pkgname/-rub/}-${pkgver}"
  patch -p1 < ${srcdir}/russian_bepo.patch
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
 }

 package() {
   cd "${srcdir}/${pkgname/-rub/}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"
  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
