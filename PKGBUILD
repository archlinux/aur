# Maintainer: 3x071c <dev ατ 3x071c δοτ com>

_vcs='git'
_author='vinceliuice'
_prefix='gnome-shell-extension-'
_base='dash-to-dock'
_suffix="-$_author"
pkgname="$_prefix$_base$_suffix-$_vcs"
pkgver=54.r562.f3445ac
pkgrel=1
pkgdesc="Moves the dash out of the overview transforming it in a dock ($_author fork)"
arch=('any')
url="https://github.com/$_author/$_base"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'sassc' 'git')
provides=("$_prefix$_base" "${pkgname%-$_vcs}")
conflicts=("$_prefix$_base" "${pkgname%-$_vcs}")
_src="$pkgname-$pkgver"
source=("$_src::$_vcs+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_src"
		printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/^.*-v//;s/-/./g')"
}

build() {
	export SASS=sassc
		cd "$srcdir/$_src"
		make
}

package() {
	cd "$srcdir/$_src"
		make DESTDIR="$pkgdir/" VERSION="$pkgver" install
}

# vim: set noet ci pi sts=0 sw=4 ts=4 syntax=bash:
