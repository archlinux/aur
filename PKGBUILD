# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-mesen-sx
pkgname=$_pkgname-git
pkgver=0.5.0.r0.g7fd2241
pkgrel=1
pkgdesc="Super Nintendo Entertainment System core"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/maddiemewmews/libretro-mesen-sx"
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/maddiemewmews/libretro-mesen-sx.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	make -C $_pkgname/Libretro LTO=
}

package() {
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/Libretro/mesen-sx_libretro.so
	install -Dm644 "$srcdir"/"$_pkgname"/mesen-sx_libretro.info "$pkgdir"/usr/share/libretro/info/mesen-sx_libretro.info
}

