# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: mrdotx <klassiker@gmx.de>
# Contributor: shulhan <ms@kilabit.info>
# Contributor: Bill Kolokithas <kolokithas.b@gmail.com>

_pkgname=j4-dmenu-desktop
pkgname=j4-dmenu-desktop-git
pkgver=2.18.r231.g7da7e1d
pkgrel=1
pkgdesc='A rewrite of i3-dmenu-desktop, which is much faster'
arch=('i686' 'x86_64')
url='https://github.com/enkore/j4-dmenu-desktop'
license=('GPL-3.0-only')
makedepends=(
	'git'
	'meson')
optdepends=(
	'dmenu: the default backend'
	'bemenu: an alternative backend'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/enkore/j4-dmenu-desktop.git")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed -r 's/^r//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	meson subprojects download
}

build() {
	cd "$pkgname"
	arch-meson build
	meson compile -C build
}

package() {
	cd "$pkgname"
	meson install -C build --destdir "$pkgdir"
}
