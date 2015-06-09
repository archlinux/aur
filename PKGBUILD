# Maintainer: Vincent Lequertier <vincent.lequertier@laposte.net>
pkgname=i3bar-icons
pkgver=4.10.2
pkgrel=1
pkgdesc="A version of i3bar which can display xbm icons"
url="https://github.com/ashinkarov/i3-extras/blob/master/i3bar-xbm-icons.patch"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxcursor' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-image' 'libev' 'yajl' 
'startup-notification' 'pango' "i3-wm>=$pkgver")
makedepends=('git' 'docbook-xsl' 'pkgconfig')
conflicts=()
replaces=()
backup=()
install=i3bar-icons.install
source=("i3bar-xbm-icons.patch"
	"http://i3wm.org/downloads/i3-$pkgver.tar.bz2")
md5sums=('474535eb096e272be9df4820e4463f74'
	 'a9ef429c05bc46b1a9fc9a8598d2a626')
build() {
  cd i3-$pkgver
  patch -Np1 -i ../i3bar-xbm-icons.patch || return 1
  cd i3bar
  make
}

package() {
  cd i3-$pkgver/i3bar
  install -D -m755 i3bar $pkgdir/usr/bin/i3bar-icons
}
