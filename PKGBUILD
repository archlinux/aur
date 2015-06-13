# Maintainer: SanskritFritz (gmail)
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=libdesktop-agnostic-git
_gitname=libdesktop-agnostic
pkgver=2013.11.01
pkgrel=1
pkgdesc='Provides an extensible config API, a unified virtual fs API, and a desktop item editor for GLib-based projects.'
arch=('i686' 'x86_64')
url='https://github.com/p12tic/libdesktop-agnostic'
license=('GPL' 'LGPL')
depends=('pygtk')
makedepends=('intltool' 'vala' 'gobject-introspection')
optdepends=('gconf: gconf configuration backend')
conflicts=('libdesktop-agnostic')
provides=('libdesktop-agnostic')
backup=("etc/xdg/libdesktop-agnostic/desktop-agnostic.ini")
source=("git://github.com/p12tic/libdesktop-agnostic.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"

	export PYTHON=/usr/bin/python2
	python2 ./waf configure --prefix=/usr --sysconfdir=/etc \
		--config-backends=gconf,keyfile \
		--vfs-backends=gio \
		--desktop-entry-backends=gio,glib
	python2 ./waf
}

package() {
	cd "$srcdir/$_gitname"

	python2 ./waf install --destdir="$pkgdir"
}
