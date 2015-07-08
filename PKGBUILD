# Contributor: Kozec <kozec at kozec dot com>
pkgname=gnome-shell-pidgin
pkgver=0.1
_pidginver=2.10.0
pkgrel=3
pkgdesc="Plugin for the Pidgin IM providing integration with gnome-shell user status menu."
url="http://sourceforge.net/projects/gnomeshpidgin/"
depends=('pidgin' 'dbus-core' 'libpurple')
source=(
	"http://downloads.sourceforge.net/gnomeshpidgin/gnomeShellPidgin.c"
	"http://hg.pidgin.im/pidgin/main/raw-file/35c8682ddee7/libpurple/internal.h"
	"include_dbus_server_add_version.patch"
	"pidgin-status-to-shell.patch"
	"Makefile"
	)
license=('GPL')
arch=('i686' 'x86_64')

build() {
	cd "$srcdir"
	mkdir -p "build"
	cd "build"
	cp -L ../gnomeShellPidgin.c ../Makefile ../internal.h .
	patch -Np0 -i ../include_dbus_server_add_version.patch || return 1
	patch -Np0 -i ../pidgin-status-to-shell.patch || return 1
	make gnomeShellPidgin.so || return 1
}

package() {
	mkdir -p "$pkgdir/usr/lib/purple-2/"
	cd "$srcdir/build"
	make DESTDIR="$pkgdir" install
}

md5sums=('09c4edcd6a1ce1c7008d942862cf7562'
         '049cda9a389f768064bc5c1af6fff341'
         'c2e3374410b89057de83e3068d61e087'
         '54d5b99d996a12add5d4bedf9370e0ec'
         'aaf9f967f51ac5ea193ff40913d509a3')
