# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=pony.computer
pkgver=1428445028
pkgrel=1
pkgdesc="Show computer information and a pony"
url="https://github.com/GNU-Pony/pony.computer"
arch=(any)
license=(GPL3)
depends=(sh ponysay coreutils python3)
optdepends=("linux: Additional system information can be provided with Linux kernel's procfs /proc"
            "filesystem: Identification of distribution"
            "lsb-release: Identification of distribution")
makedepends=(make coreutils sed texinfo)
install=pony.computer.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(997f8be119e36cbbdcafee2126ceccfac3e6551d839b78a93aba748f33d4469d)

_prefix=/usr


build() {
	cd "${srcdir}/pony.computer-${pkgver}"
	make PREFIX="${_prefix}" PKGNAME="${pkgname}" DISTRO="Arch Linux"
}

package() {
	cd "${srcdir}/pony.computer-${pkgver}"
	make PREFIX="${_prefix}" PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install
	_dir="${pkgdir}${_prefix}/share/licenses/${pkgname}"
	mkdir -p -- "${_dir}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

