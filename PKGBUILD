# $Id$
# Maintainer: xj9 <aur@xj-ix.luxe>

pkgname=xjdwm
pkgver=6.2+tracker.1
pkgrel=3
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11'
	'cantata'
	'yggdrasil'
	'fossil'
	'busybox'
	'redshift'
	'keepassxc'
	'tmux'
	'vim'
	'mpv'
	'syncthing'
	'syncthing-gtk'
	'libxinerama'
	'libxft'
	'freetype2'
	'xfce4-terminal'
	'dmenu'
	'otf-font-awesome'
	'otf-hermit')
install=dwm.install
source=($pkgname-$pkgver.tar.gz::http://git.hackers.town/xj9/xjdwm/archive/$pkgver.tar.gz
	dwm.desktop)
sha256sums=('302a87ed86c61532dd1673d6b6c5db49dbf333c8404b09df96bacbadd4717100'
            'bc36426772e1471d6dd8c8aed91f288e16949e3463a9933fee6390ee0ccd3f81')

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
  install -m644 -D "$srcdir/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}
