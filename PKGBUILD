# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=xpybar
pkgver=1.21.1
pkgrel=1
pkgdesc="A highly extensible minimalistic dock panel configured in Python 3"
arch=(any)
url="https://codeberg.org/maandree/xpybar"
license=('GPL3' 'AGPL3')
depends=(python3 argparser-python 'python-xlib>=0.18' xorg-xrandr)
optdepends=("alarm: for limiting the time of a file search in locks"
            "curl: for Internet services"
	    "file: for image support"
	    "findutils: for file search in locks"
	    "graphicsmagick: for image support"
	    "hdparm: hdparm: for hdparm support"
	    "ii: for ii support"
	    "imagemagick: for image support"
	    "inotify-tools: for ii and inotify support"
	    "iputils: for ping support"
	    "librsvg: for image support"
	    "linux: most of the monitors require Linux's procfs or sysfs"
	    "pdeath: for automatic killing of child processes on exit"
	    "python-pyalsaaudio: for ALSA volume control"
	    "python-pytz: for timezone support"
	    "python-sysv-ipc: for ropty example"
	    "solar-python: for solar data (>= 2.5)")
makedepends=(make coreutils sed zip auto-auto-complete texinfo)
install=xpybar.install
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(162ea07a0b84ce1df7f4f7be5d338253019205c12dea4d2464436ab96720ce73)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr HDPARM_PATH=/usr/bin/hdparm
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr HDPARM_PATH=/usr/bin/hdparm DESTDIR="$pkgdir" install
  chmod 4755 "$pkgdir/usr/bin/restricted-hdparm"
}

