# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-dice
pkgname=$_pkgname-git
pkgver=r177.4b0ab18
pkgrel=1
pkgdesc="Discrete circuitry-based arcade core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/mittonk/dice-libretro"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info>=1.20.0.r4')
makedepends=('git')
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i 's/-O[0123s]//' $_pkgname/Makefile.libretro
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/dice_libretro.so
}
