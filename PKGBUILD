# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-numero
pkgname=$_pkgname-git
pkgver=r36.19354c9
pkgrel=2
pkgdesc="Texas Instruments TI-83 series core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/nbarkhina/numero"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info>=1.15')
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
	sed -i 's/-O[0123s]//;s/-Ofast//' $_pkgname/Makefile.libretro
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/numero_libretro.so
}
