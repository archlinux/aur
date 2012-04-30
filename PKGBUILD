# Maintainer: jjacky
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-hover-inactive
pkgver=4.10.0
pkgrel=1
pkgdesc="Xfce window manager w/ hover effect for inactive windows"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=("libxfce4ui" 'libwnck' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
provides=('xfwm4=4.10.0')
conflicts=('xfwm4')
install=${pkgname}.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.10/${_pkgname}-${pkgver}.tar.bz2
	hover-inactive.patch)
md5sums=('333e5e25a85411c304e9b4474bf00537'
         'de495984f2477d3b270b6fb2031278bc')
sha1sums=('1549954949b5e1f38a2279a39a477b52bb5339f2'
          '180be7953007c17d1ea64bcfb2cd116291759fc1')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p1 -i ../hover-inactive.patch
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
