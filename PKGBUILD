# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-mesen
pkgname=$_pkgname-git
pkgver=0.9.9.r127.gcec4911d
pkgrel=1
pkgdesc="Nintendo Entertainment System core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://www.mesen.ca/"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/libretro/Mesen.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	make -C $_pkgname/Libretro
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/Libretro/mesen_libretro.so
}
