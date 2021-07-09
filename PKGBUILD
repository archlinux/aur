# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Oliver Jaksch <arch-aur at com-in dot de>
# Contributor: Mike Polvere <mic.tjs@gmail.com>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libretro-gambatte
pkgname=$_pkgname-git
pkgver=r912.ff1ae4a
pkgrel=1
epoch=1
pkgdesc="Nintendo Game Boy/Game Boy Color core"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/libretro/gambatte-libretro"
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/gambatte_libretro.so
}
