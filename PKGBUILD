# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur@com-in.de>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-stella
pkgname=$_pkgname-git
pkgver=6.2.r153.g67db826bc
pkgrel=1
epoch=1
pkgdesc="A multi-platform Atari 2600 Emulator"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://stella-emu.github.io/"
license=('GPL2')
groups=('libretro')
depends=('libretro-core-info' 'glibc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/stella-emu/stella.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	make -C src/libretro
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro src/libretro/stella_libretro.so
}
