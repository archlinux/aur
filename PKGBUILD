# $Id$
# Maintainer: xj9 <aur@xj-ix.luxe>

pkgname=xjdwm
pkgver=6.2+tracker.3
pkgrel=4
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=(
	'busybox'
	'cantata'
	'chicken'
	'clang'
	'clementine'
	'compton'
	'dmenu'
	'evolution'
	'evolution-bogofilter'
	'evolution-rss'
	'evolution-spamassassin'
	'feh'
	'fossil'
	'freetype2'
	'highlight'
	'keepassxc'
	'libx11'
	'libxft'
	'transmission-remote-gtk'
	'libxinerama'
	'lxappearance-gtk3'
	'mpv'
	'network-manager-applet'
	'otf-font-awesome'
	'otf-hermit'
	'pasystray'
	'plan9port'
	'profanity'
	'redshift'
	'syncthing'
	'syncthing-gtk'
	'tk'
	'tmux'
	'vim'
	'alacritty'
	'xorg-xrandr'
	'xorg-xsetroot'
	'yggdrasil'
	'youtube-dl'
)
install=dwm.install
source=($pkgname-$pkgver.tar.gz::http://git.hackers.town/xj9/xjdwm/archive/$pkgver.tar.gz
	dwm.desktop)
sha256sums=('57e314a34d3d3c40a6bf31cd00758d6dd615e4755c35b6c7a0ff1d7523766395'
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
