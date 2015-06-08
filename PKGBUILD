# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Olaf Bauer <hydro@freenet.de>
pkgname=kodi-addon-xvdr-git
pkgver=20150427
pkgrel=1
pkgdesc="PVR add-on for KODI to add VDR as a TV/PVR Backend to KODI"
arch=('i686' 'x86_64')
url="https://github.com/pipelka/xbmc-addon-xvdr"
license=('GPL2')
depends=('gcc-libs' 'zlib' 'kodi')
conflicts=('kodi-addon-xvdr')
provides=('kodi-addon-xvdr')
makedepends=('git')
source=('git+https://github.com/pipelka/xbmc-addon-xvdr')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/xbmc-addon-xvdr"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "$srcdir/xbmc-addon-xvdr"
  sh autogen.sh
  ./configure --prefix=/usr/lib/kodi
  make
}

package() {
  cd "$srcdir/xbmc-addon-xvdr"
  make DESTDIR="${pkgdir}/" install
}
