# Maintainer: jjacky
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfwm4
pkgname=$_pkgname-better-smartplacement
pkgver=4.12.5
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
source=(https://archive.xfce.org/src/xfce/${_pkgname}/4.12/${_pkgname}-${pkgver}.tar.bz2
        0001-Rewrote-smartPlacement.patch
        0002-smartPlacement-w-snap_to_border-we-snap-to-bottom-ri.patch
        0003-Fix-new-window-always-top-left-when-screen-not-full.patch)
sha1sums=('c41e435d07d8b782e534bbdde45e429bc59b3fa2'
          '337ce16ecb4cd30625df2210dbdd898e160e8a0d'
          '248b47a1e3992c28f668e89f821ee86562a7ad8f'
          'e325137f81ef39305c10ab82bdbf60f592fac65e')

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
