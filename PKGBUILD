# Maintainer: Byeonghoon Isac Yoo <bh322yoo at gmail dot com>

_pkgname=nimf
pkgname=nimf-libhangul-git
pkgver=1.3.0.r5.f02290d
pkgrel=2
pkgdesc="Nimf is a lightweight, fast and extensible input method framework. (libhangul only)"
arch=('any')
url="https://github.com/hamonikr/nimf"
license=('LGPL3')
depends=(
	'glib2'
	'libxklavier'
	'libhangul-git'
	'libxkbcommon>=0.5.0'
	'libappindicator-gtk3'
)
makedepends=(
	'git'
	'gcc'
	'intltool'
	'gtk-doc'
	'gtk2'
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
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
