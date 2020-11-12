# $Id$
# Maintainer: xj9 <aur@xj-ix.luxe>

pkgname=xjdwm
pkgver=6.2+tracker.2
pkgrel=2
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11'
	'cantata'
	'yggdrasil'
	'fossil'
	'xorg-xsetroot'
	'feh'
	'chicken'
	'clang'
	'compton'
	'network-manager-applet'
	'pasystray'
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
sha256sums=('f71415563eb16e447d31893e5173dcbad2c851472d660f1a2ce54be6bee59d03'
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
