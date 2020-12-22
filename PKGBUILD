# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-dosbox-pure
pkgname=$_pkgname-git
pkgver=0.1.r0.g1502730
pkgrel=1
pkgdesc="New fork of DOSBox built for RetroArch/Libretro aiming for simplicity and ease of use"
arch=('x86_64')
url="https://github.com/schellingb/dosbox-pure"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git"
        'dosbox_pure_libretro.info')
md5sums=('SKIP'
         '8f8b1f9ae67943f6ead7d6f8bfd077c1')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	make CXX=g++
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro dosbox_pure_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/libretro/info ../dosbox_pure_libretro.info
}
