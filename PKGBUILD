# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: onestep_ua <onestep@ukr.net>

pkgname=polkit-gnome-gtk2
_pkgname=polkit-gnome
pkgver=0.102
pkgrel=1
pkgdesc="PolicyKit integration for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/PolicyKit"
license=('LGPL')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('polkit' 'gtk2')
makedepends=('intltool' 'gobject-introspection')
options=(!libtool)
source=(http://download.gnome.org/sources/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.xz
        polkit-gnome-authentication-agent-1.desktop)
sha256sums=('c78cee0001128dc1b00248ed11ffd23988d9cd0ce78c8b00eb36880b289e7598'
            'ad19e73ae8eba00a8f66bd9afd3e0e1fd7ca22f716e29b97f097d9c01711e0de')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/polkit-gnome \
      --disable-static
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/polkit-gnome-authentication-agent-1.desktop" \
      "${pkgdir}/etc/xdg/autostart/polkit-gnome-authentication-agent-1.desktop"
}
