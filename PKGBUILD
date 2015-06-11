# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

# If want to minimise the memory usage exchange bash for dash

pkgname=gates-of-tartaros
pkgver=1428445207
pkgrel=1
pkgdesc="Extensible minimal replacement for agetty with SSH support"
url="https://github.com/GNU-Pony/gates-of-tartaros"
arch=(any)
license=(GPL3)
depends=(util-linux bash coreutils)
optdepends=(openssh)
makedepends=(make sed coreutils texinfo)
install=gates-of-tartaros.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(5b49d6882e95691c71c87524e8d709249b0c53568d4ac5d335e62f494f1c43bc)


build() {
	cd "${srcdir}/gates-of-tartaros-${pkgver}"
	make PKGNAME="${pkgname}" SBIN=/bin PREFIX=/usr SH=bash
}

package() {
	cd "${srcdir}/gates-of-tartaros-${pkgver}"
	make PKGNAME="${pkgname}" SBIN=/bin PREFIX=/usr DESTDIR="${pkgdir}" install
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

