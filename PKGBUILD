# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Contributor: Vincent Bernardoff <vb AT luminar.eu.org>

_pkgname=mmc-utils
pkgname=${_pkgname}-git
pkgver=r139.67b9be6
pkgrel=1
epoch=1
pkgdesc="Userspace tools for MMC/SD devices"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git"
license=('GPL')
makedepends=('git' 'sparse')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	'git+https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git'
	'0001-makefile-gcc-include-fix.patch'
)
sha256sums=(
	'SKIP'
	'94f186b432710c456e1593642b9ea9dd6b27a6aa99076266b08d5a5950f89973'
)

prepare() {
        cd "${_pkgname}"
        git apply ../0001-makefile-gcc-include-fix.patch --ignore-whitespace
}

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/man/man1/"
	make DESTDIR="${pkgdir}" prefix=/usr install
}
