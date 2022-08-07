# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Contributor: Vincent Bernardoff <vb AT luminar.eu.org>

_pkgname=mmc-utils
pkgname=${_pkgname}-git
pkgver=r98.d7b343f
pkgrel=1
epoch=1
pkgdesc="Userspace tools for MMC/SD devices"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git"
license=('GPL')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C "${_pkgname}"
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" prefix=/usr install
	install -Dm644 man/mmc.1 "${pkgdir}/usr/share/man/man1/mmc.1"
}
