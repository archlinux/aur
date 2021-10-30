# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-dosbox-pure
pkgname=$_pkgname-git
pkgver=0.20.r2.gf6b8c46
pkgrel=1
pkgdesc="MS-DOS core"
arch=('x86_64')
url="https://github.com/schellingb/dosbox-pure"
license=('GPL2')
groups=('libretro')
depends=('gcc-libs' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -Ei 's/^(\s*(CFLAGS|LDFLAGS)\s*):=/\1+=/;s/-Wno-format//' $_pkgname/Makefile
}

build() {
	make -C $_pkgname
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/libretro $_pkgname/dosbox_pure_libretro.so
}
