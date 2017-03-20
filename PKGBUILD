# Maintainer: jjacky
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-better-smartplacement
pkgver=4.12.4
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
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.12/${_pkgname}-${pkgver}.tar.bz2
        0001-Rewrote-smartPlacement.patch
        0002-smartPlacement-w-snap_to_border-we-snap-to-bottom-ri.patch
        0003-Fix-new-window-always-top-left-when-screen-not-full.patch)
sha1sums=('d1019cce2a2f7978e36cb30fdc0f27cf9f626244'
          '54a9c4938f23554f9452e355577055980104c310'
          'c50220a372564ebd83426176fc252782365c3872'
          '37fb87c433488b09447af1b0eb9e20e501ef4450')

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
