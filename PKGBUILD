# Maintainer: jjacky
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-better-smartplacement
pkgver=4.12.0
pkgrel=1
pkgdesc="Xfce window manager w/ better smart placement of new windows"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=("libxfce4ui" 'libwnck' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
provides=($_pkgname)
conflicts=($_pkgname)
install=${pkgname}.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.10/${_pkgname}-${pkgver}.tar.bz2
        0001-Rewrote-smartPlacement.patch
        0002-smartPlacement-w-snap_to_border-we-snap-to-bottom-ri.patch
        0003-Fix-new-window-always-top-left-when-screen-not-full.patch)
sha1sums=('5c3ea9faaa9b45a40ca7ecfff447cdca192534f6'
          '14c407c8734add318b7b0f0a9b86bcaf6a210b81'
          '4cb167d59c1ad0776aa9a53cafafd0168ede5cc9'
          '89f5b54d7370db86c7547580a6d1376cb88980fa')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p1 -i ../0001-Rewrote-smartPlacement.patch
  patch -p1 -i ../0002-smartPlacement-w-snap_to_border-we-snap-to-bottom-ri.patch
  patch -p1 -i ../0003-Fix-new-window-always-top-left-when-screen-not-full.patch
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
