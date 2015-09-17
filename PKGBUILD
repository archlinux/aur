# $Id: PKGBUILD 120986 2014-10-19 20:27:33Z bgyorgy $
# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gnome-mplayer-light-theme
pkgver=1.0.9
pkgrel=1
pkgdesc='A simple MPlayer GUI.'
arch=('i686' 'x86_64')
url='http://gnome-mplayer.googlecode.com/'
license=('GPL')
depends=('mplayer' 'dbus-glib' 'libnotify' 'hicolor-icon-theme' 'dconf' 'gmtk')
makedepends=('nautilus' 'gconf')
provides=(gnome-mplayer=${pkgver})
conflicts=('gnome-mplayer')
install="${pkgname}.install"
source=("https://${pkgname}.googlecode.com/svn/packages/gnome-mplayer-${pkgver}.tar.gz"
        "gtk-theme-notdark.patch")
md5sums=('26c3ab335b6fcdda220b05c977f5b0f1'
         '4d7cd9c319a7a33709eed1882f1708b8')

prepare() {
  cd "${srcdir}/gnome-mplayer-${pkgver}"

  patch -p0 -i "${srcdir}/gtk-theme-notdark.patch"
  autoreconf -fi
}

build() {
  cd "${srcdir}/gnome-mplayer-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install
  make
}

package() {
  cd "${srcdir}/gnome-mplayer-${pkgver}"

  make DESTDIR="${pkgdir}" install

  sed -i 's@Exec=gnome-mplayer %U@Exec=gnome-mplayer %F@' \
    "${pkgdir}/usr/share/applications/gnome-mplayer.desktop"
}
