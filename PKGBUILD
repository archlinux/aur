# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=xemu
pkgname=$_pkgname-git
pkgver=0.5.1.r7096.g30042e8091
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=('x86_64')
url="https://xemu.app/"
license=('GPL2')
depends=('gtk3' 'libsamplerate' 'sdl2')
makedepends=('git' 'glu' 'ninja' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/mborgerson/xemu.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^xemu-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	./build.sh
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm755 -t "$pkgdir"/usr/bin dist/xemu
	install -Dm644 -t "$pkgdir"/usr/share/xemu/data dist/data/*
	install -Dm644 -t "$pkgdir"/usr/share/applications ui/xemu.desktop
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps ui/icons/xemu.svg
}
