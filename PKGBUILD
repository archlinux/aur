# Maintainer: Raansu <Gero3977@gmail.com>
# Contributor: Milos Pejovic (pejovic@gmail.com)

pkgname=tvtime-alsa
_tvtime_hgrev=111b28cca42d
pkgver=1.0.2_p20110131
pkgrel=2
pkgdesc="tvtime with ALSA patches from Gentoo"
depends=('libpng' 'libxml2' 'freetype2' 'libxss' 'libxinerama' 'libxv' 'libsm' 'libxxf86vm' 'alsa-lib')
source=(http://tvtime-fixed.googlecode.com/files/${_tvtime_hgrev}.tar.bz2
        tvtime-pic.patch
        tvtime-1.0.2-xinerama.patch
        tvtime-1.0.2_p20110131-libsupc++.patch
        tvtime-1.0.2_p20110131-autotools.patch
        tvtime-1.0.2_p20110131-gettext.patch
        tvtime-libpng-1.5.patch
        tvtime-1.0.2_p20110131-underlinking.patch
        tvtime-1.0.2-alsamixer-r1.patch
        tvtime-1.0.2-alsa-r1.patch
        tvtime-1.0.2-alsa-fixes.patch)
url='http://tvtime.sourceforge.net/'
provides=('tvtime')
conflicts=('tvtime')
arch=('i686' 'x86_64')
license=('GPL')
build() {
  cd $srcdir/tvtime-$_tvtime_hgrev

  # Rename the desktop file
  mv docs/net-tvtime.desktop docs/tvtime.desktop
  sed -i -e "s/net-tvtime.desktop/tvtime.desktop/g" docs/Makefile.am

  # use 'tvtime' for the application icon
  sed -i -e "s/tvtime.png/tvtime/" docs/tvtime.desktop

  # patch to adapt to PIC or __PIC__ for pic support
  patch -Np1 -i "${startdir}/tvtime-pic.patch"

  patch -Np1 -i "${startdir}/tvtime-1.0.2-xinerama.patch"

  patch -Np1 -i "${startdir}/tvtime-1.0.2_p20110131-libsupc++.patch"

  patch -Np1 -i "${startdir}/tvtime-1.0.2_p20110131-autotools.patch"
  patch -Np1 -i "${startdir}/tvtime-1.0.2_p20110131-gettext.patch"
  patch -Np1 -i "${startdir}/tvtime-libpng-1.5.patch"
  patch -Np0 -i "${startdir}/tvtime-1.0.2_p20110131-underlinking.patch"

  patch -Np1 -i "${startdir}/tvtime-1.0.2-alsa-r1.patch"
  patch -Np1 -i "${startdir}/tvtime-1.0.2-alsamixer-r1.patch"
  patch -Np1 -i "${startdir}/tvtime-1.0.2-alsa-fixes.patch"

  autoreconf -i -f
  ./configure --prefix=/usr --mandir=/usr/share/man --localstatedir=/var --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/tvtime-$_tvtime_hgrev
  make DESTDIR=$pkgdir install
  install -D -m644 docs/html/default.tvtime.xml $pkgdir/usr/share/tvtime/default.tvtime.xml
}

md5sums=('3f68ec60da6cc0d73339fb4ccc1b4a04'
         '4bc08a98c7cc134accb89aea3018c2f6'
         '7716009f7064bdae850d1464e33f455d'
         '5546ca7925e090bf96e9bc39e7a3966b'
         'e5eba913001bd1818774214ba6b8d089'
         '1d4da6032609e0c85decb7853f338eb3'
         '2d450f35002c5da5f2591b59ab69a470'
         'e74e1b88af101a9e2091cee732b4025e'
         '6c2f03bfc75a189cb73cba123696e442'
         '906f46b391ac2d6e8b2c1d1cc501e122'
         '482aee09364762cfa16bd7ece2af5c4b')


