# Maintainer: éclairevoyant
# Contributor: Dave Reisner <d at falconindy dot com>

_pkgname=pkgfile
pkgname="$_pkgname-git"
pkgver=21.r52.9c45690
pkgrel=1
epoch=1
pkgdesc="a pacman .files metadata explorer"
arch=('x86_64' 'i686')
url="https://github.com/falconindy/$_pkgname"
license=('MIT')
depends=(curl libarchive pacman pcre systemd-libs)
makedepends=(git meson perl)
checkdepends=(gmock gtest python)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	arch-meson build
	ninja -C build
}

check() {
	cd $_pkgname
	meson test -C build
}

package() {
	cd $_pkgname
	DESTDIR="$pkgdir" ninja -C build install
}
