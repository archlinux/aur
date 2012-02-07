# Maintainer: jjacky
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-hover-inactive
pkgver=4.8.3
pkgrel=1
pkgdesc="Xfce window manager w/ hover effect for inactive windows"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=("libxfce4ui" 'libwnck' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
provides=('xfwm4=4.8.3')
conflicts=('xfwm4')
install=${pkgname}.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.8/${_pkgname}-${pkgver}.tar.bz2
	hover-inactive.patch)
md5sums=('66cb65797cea8a62563f69b833c7888b'
         '2a64105b4db589ecc8cdfee29ff68851')
sha1sums=('6d27deca383e0c2fba0cede0bbe0e9aee18e9257'
          'b14eb1286dc618b8ffcb0bf2995c16bc1d4f9e6f')

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
