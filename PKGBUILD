# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=xemu
pkgname=$_pkgname-git
pkgver=0.3.0.r2.gfcd3764cce
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=('x86_64')
url="https://xemu.app/"
license=('GPL2')
depends=('sdl2' 'libepoxy' 'pixman' 'gtk3' 'glu')
makedepends=('git' 'python')
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
	install -Dm755 i386-softmmu/qemu-system-i386 "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 -t "$pkgdir"/usr/share/$_pkgname/data data/*
	install -Dm644 ui/xemu.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
	install -Dm644 ui/icons/xemu.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
}
