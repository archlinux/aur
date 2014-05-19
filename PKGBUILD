# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wmcdplay
pkgdesc="A CD player WindowMaker dock app"
pkgver=1.0beta1
pkgrel=1
arch=(i686 x86_64)
url="http://www.geocities.com/SiliconValley/Vista/2471/wmcdplay.html"
license=('GPL')
depends=('libxpm')
makedepends=('imake')
source=("http://http.us.debian.org/debian/pool/main/w/wmcdplay/wmcdplay_1.0beta1.orig.tar.gz"
	"http://http.us.debian.org/debian/pool/main/w/wmcdplay/wmcdplay_1.0beta1-11.diff.gz")
md5sums=('3b84b902186ba65770c268841ca12ae2'
         'dd781aa4d8e4c79b7a3397bbc220d993')

prepare() {
  cd "${srcdir}/wmcdplay"
  patch -Np1 -b -z .orig -i ../wmcdplay_1.0beta1-11.diff
}

build() {
  cd "${srcdir}/wmcdplay"
  xmkmf -a
  sed -i 's,-DX_LOCALE,,g' Makefile
  make CC=c++ CXXDEBUGFLAGS="-g -O2"
}

package() {
  cd "${srcdir}/wmcdplay"
  install -Dm0755 wmcdplay "${pkgdir}/usr/bin/wmcdplay"
  install -d "${pkgdir}/usr/share/wmcdplay"
  install -m0644 XPM/*.art "${pkgdir}/usr/share/wmcdplay"
  install -Dm0644 debian/wmcdplay.1x "${pkgdir}/usr/share/man/man1/wmcdplay.1"
}

