# Maintainer: Kai Korla <balticer@balticer.de>

pkgname=gnome-dvb-daemon-git
pkgver=r1356.23dd846
pkgrel=1
pkgdesc='GStreamer based to setup DVB devices, record and watch TV shows and browse EPG.'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/action/show/Projects/DVBDaemon'
license=('GPL')
depends=('gst-rtsp-server' 'gst-plugins-good' 'gst-plugins-bad' 'sqlite' 'libgee' 'dtv-scan-tables')
makedepends=('git' 'gnome-common' 'vala')
conflicts=('gnome-dvb-daemon')
provides=('gnome-dvb-daemon')
source=('git://git.gnome.org/gnome-dvb-daemon')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/gnome-dvb-daemon"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/gnome-dvb-daemon"
	
	./autogen.sh
	./configure --prefix=/usr --disable-grilo-plugin

	make ${MAKEFLAGS} 
}

package() {
	cd "$srcdir/gnome-dvb-daemon"

	make install DESTDIR="$pkgdir"
}
