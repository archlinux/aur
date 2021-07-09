# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-dosbox-pure
pkgname=$_pkgname-git
pkgver=0.13.r8.gb97c9a6
pkgrel=1
pkgdesc="New DOSBox core"
arch=('x86_64')
url="https://github.com/schellingb/dosbox-pure"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -E 's/^(\s*(CFLAGS|LDFLAGS)\s*):=/\1+=/;s/-Wno-format//' -i $_pkgname/Makefile
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/dosbox_pure_libretro.so
}
