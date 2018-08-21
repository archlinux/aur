# Maintainer: jjacky
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-hover-inactive
pkgver=4.12.5
pkgrel=1
pkgdesc="Xfce window manager w/ hover effect for inactive windows"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=("libxfce4ui" 'libwnck' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
provides=($_pkgname)
conflicts=($_pkgname)
source=(https://archive.xfce.org/src/xfce/${_pkgname}/4.12/${_pkgname}-${pkgver}.tar.bz2
        0001-Add-hover-effects-for-titlebar-s-buttons-of-inactive.patch)
sha1sums=('c41e435d07d8b782e534bbdde45e429bc59b3fa2'
          'd018ab82df264c0d222ac95704e86a840534e324')

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
