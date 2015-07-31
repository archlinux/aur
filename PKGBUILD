# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=konbini3
pkgver=1
pkgrel=1
pkgdesc="Convenience Store of Packages for i3wm"
arch=('any')
license=('BSD')
groups=()
depends=('pulseaudio' 'sddm' 'habak' 'i3-gaps-next-git' 'i3lock-blur' 'gnome-backgrounds' 'zim' 'bc' 'dmenu' 'uzbl-browser' 'xorg-xbacklight' 'rofi' 'network-manager-applet' 'pasystray' 'udisks2' 'udiskie' 'polkit-kde' )
makedepends=()
provides=('konbini3')
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_gitrepo=https://github.com/jcelerier/konbini3
_gitdir=konbini3

build() {
	git clone "$_gitrepo"
}
package() {
  install -D -m644 "$srcdir/$_gitdir/konbini3.desktop" "${pkgdir}/usr/share/xsessions/konbini3.desktop"
  install -D -m755 "$srcdir/$_gitdir/konbini3" "${pkgdir}/usr/bin/konbini3"
  mkdir -p "${pkgdir}/etc/skel/.i3"
  install -D -m644 "$srcdir/$_gitdir/config" "${pkgdir}/etc/skel/.i3/config"
}

post_install() {
	systemctl enable NetworkManager.service
	systemctl start NetworkManager.service
}
