# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-same-cdi
pkgname=$_pkgname-git
pkgver=r19.dcc76a5b
pkgrel=1
pkgdesc="Philips CD-i core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/same_cdi"
license=('GPL2')
groups=('libretro')
depends=('glibc' 'libretro-core-info')
makedepends=('git' 'libglvnd' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C $_pkgname -f Makefile.libretro
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro same_cdi_libretro.so
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
}
