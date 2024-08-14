# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-gearcoleco
pkgname=$_pkgname-git
pkgver=1.2.0.r4.g99033ec
pkgrel=1
pkgdesc="Coleco ColecoVision core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/drhelius/Gearcoleco"
license=('GPL-3.0-only')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	sed -i 's/-O[0123s]//' platforms/libretro/Makefile
}

build() {
	cd $_pkgname
	make -C platforms/libretro
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make -C platforms/libretro DESTDIR="$pkgdir" install
}
