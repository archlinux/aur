# Maintainer: Jason Nader <jason.nader protonmail com> 
# Based on community PKGBUILD by
# Christian Rebischke <chris.rebischke@archlinux.org>
# Thomas Weißschuh <thomas t-8ch de>

pkgname=pinentry-bemenu-git
_pkgname=pinentry-bemenu
pkgver=v0.14.0.r0.g9723691
pkgrel=1
pkgdesc="Pinentry based on bemenu"
arch=("x86_64")
url="https://github.com/t-8ch/pinentry-bemenu"
license=("GPL2")
provides=("pinentry")
depends=("bemenu" "libassuan" "libgpg-error" "popt")
makedepends=("meson" "ninja" "cmake" "pkgconf" "popt")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	arch-meson build
	cd build
	ninja
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	DESTDIR="$pkgdir" ninja install
}
