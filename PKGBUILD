# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=splashtool
pkgver=1428445153
pkgrel=1
pkgdesc="A simple tool for creating SYSLINUX splashes without fuss"
url="https://github.com/GNU-Pony/splashtool"
arch=(any)
license=(AGPL3)
depends=(gzip nafe kbd imagemagick bash awk grep sed coreutils glibc)
makedepends=(make coreutils sed glibc gcc texinfo)
install=splashtool.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(a25957c5f20166f7590f9795e0736faf955bf5f583b3d7b299031259c68a36a9)

_prefix=/usr


build() {
	cd "${srcdir}/splashtool-${pkgver}"
	make
}

package() {
	cd "${srcdir}/splashtool-${pkgver}"
	make PREFIX="${_prefix}" PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install
	_dir="${pkgdir}${_prefix}/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/AGPL3" "${_dir}/LICENSE"
}

