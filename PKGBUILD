# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=got-diminished
pkgver=1396890724
pkgrel=1
pkgdesc="Extension for gates-of-tartaros to minimise memory usage after logging in"
url="https://github.com/GNU-Pony/got-diminished"
arch=(i686 x86_64 armv6h)
license=(GPL3)
depends=(glibc coreutils util-linux gates-of-tartaros)
optdepends=(openssh)
makedepends=(make sed coreutils gcc)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(5d143931d9ec8cd2dbf9347aabb269ba2180ef4a961547ac31467091ec537be4)


build() {
	cd "${srcdir}/got-diminished-${pkgver}"
	make PKGNAME="${pkgname}" LIBEXEC=/bin
}

package() {
	cd "${srcdir}/got-diminished-${pkgver}"
	make PKGNAME="${pkgname}" LIBEXEC=/bin DESTDIR="${pkgdir}" LICENSES=/usr/share/licenses install
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

