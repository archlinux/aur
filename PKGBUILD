# Maintainer: Byeonghoon Isac Yoo <bh322yoo at gmail dot com>

_pkgname=nimf
pkgname=nimf-libhangul-git
pkgver=1.4.19.r1.gb4a141a
pkgrel=1
pkgdesc="Nimf is a lightweight, fast and extensible input method framework. (libhangul only)"
arch=('x86_64' 'aarch64')
url="https://github.com/hamonikr/nimf"
license=('LGPL-3.0-or-later')
depends=(
	'glib2'
	'libxklavier'
	'libhangul'
	'libxkbcommon>=0.5.0'
	'libayatana-appindicator'
)
makedepends=(
	'git'
	'glib2-devel'
	'intltool'
	'gtk-doc'
	# gtk2 was removed from official Arch repos; GTK2 IM module is optional in configure.ac
	'gtk3'
	'gtk-update-icon-cache'
	'librsvg'
	'libx11'
	'wayland-protocols'
	'wayland'
	'qt5-base'
)
source=( "${_pkgname}::git+${url}.git" )
md5sums=('SKIP' )

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/-\([0-9]\+\)-g/.r\1.g/')"
}


build() {
	cd "$srcdir/${_pkgname}"
	./autogen.sh --prefix=/usr --disable-nimf-anthy --disable-nimf-m17n --disable-nimf-rime
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="${pkgdir}/" install
}
