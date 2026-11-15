# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-parallel-dc
pkgname=$_pkgname-git
pkgver=r7.rc1.r4340.g8250825
pkgrel=1
pkgdesc="Sega Dreamcast, NAOMI, NAOMI 2, Atomiswave and System SP core (Derived from Flycast by flyinghead)"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/libretro/parallel-dc"
license=('GPL-2.0-only')
groups=('libretro')
depends=('glibc' 'glslang' 'libretro-core-info')
makedepends=(
	'git'
	'clang'
	'glm'
	'libgcc'
	'libgl'
	'libstdc++'
	'libzip'
	'miniupnpc'
	'xxhash'
	'zlib'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"parallel-dc::git+$url.git"
)
b2sums=(
	'SKIP'
)

pkgver() {
	cd parallel-dc
	git describe --long --tags --abbrev=7 | sed 's/^v//i;s/[^-]*-g/r&/;s/-/./g'
}

build() {
	cd parallel-dc
	CC=clang CXX=clang++ make HAVE_CLANG=1
}

package() {
	depends+=(
		'libgcc_s.so'
		'libstdc++.so'
	)

	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro parallel-dc/parallel_dc_libretro.so
	install -Dm644 parallel-dc/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

}
