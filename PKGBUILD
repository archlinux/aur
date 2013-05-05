# Maintainer: jjacky
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-hover-inactive
pkgver=4.10.1
pkgrel=1
pkgdesc="Xfce window manager w/ hover effect for inactive windows"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=("libxfce4ui" 'libwnck' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
provides=('xfwm4=4.10.1')
conflicts=('xfwm4')
install=${pkgname}.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.10/${_pkgname}-${pkgver}.tar.bz2
        0001-Add-hover-effects-for-titlebar-s-buttons-of-inactive.patch)
sha1sums=('cbfb1beee0e952f133ef851526823b472992de1d'
          'b0421e8147411083028e3dfe0df69ce959ac435d')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p1 -i ../0001-Add-hover-effects-for-titlebar-s-buttons-of-inactive.patch
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --libexecdir=/usr/lib \
      --localstatedir=/var \
      --disable-static \
      --enable-startup-notification \
      --enable-randr \
      --enable-compositor \
      --enable-xsync \
      --disable-debug
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
