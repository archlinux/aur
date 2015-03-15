# Maintainer: jjacky
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-better-smartplacement
pkgver=4.12.1
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
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.12/${_pkgname}-${pkgver}.tar.bz2
        0001-Fix-a-mishmash-between-width-and-height.patch
        0001-Rewrote-smartPlacement.patch
        0002-smartPlacement-w-snap_to_border-we-snap-to-bottom-ri.patch
        0003-Fix-new-window-always-top-left-when-screen-not-full.patch)
sha1sums=('e7470b69bba29c9c0e0bcd1471e80b73c6ccfd91'
          '2fc881cf4fbdbd7c6f55eb5d4900dc133516ee14'
          'ea46b6b9561bdd2e4f5225b4aeed811b2ed5d890'
          'e179b132c8da76a6b75e51bb7364e19ba9ecf7de'
          '9356911cd08c9703f356c0b7993a6392302dbcad')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -p1 -i ../0001-Fix-a-mishmash-between-width-and-height.patch
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
