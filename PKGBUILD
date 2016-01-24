# Maintainer: Ricky Sheaves <ricky[at]westdowneast[dot]com>
pkgname=mudita24-svn
pkgver=1.1.0.r16
pkgrel=1
pkgdesc="Improved Control Panel for Ice1712 Audio Cards"
arch=('i686' 'x86_64')
url="http://code.google.com/p/mudita24/"
license=('GPLv2')
depends=('alsa-lib'
	       'gtk2>=2.2')
makedepends=('cmake'
	           'subversion')
source=($pkgname::svn+http://mudita24.googlecode.com/svn/trunk/
	      mudita24.desktop
	      mudita24.png)
md5sums=( 'SKIP'
          '71d692e6edea031aa791c92862e5d95d'
          '3f039ae5900c449d1887e34ce1ebfc62')

build() {
  cd $pkgname/mudita24
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname/mudita24
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/mudita24.desktop" "${pkgdir}/usr/share/applications/mudita24.desktop"
  install -D -m644 "${srcdir}/mudita24.png"     "${pkgdir}/usr/share/pixmaps/mudita24.png"
  
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/mudita24/COPYING"
}
