# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=ponyguests
pkgver=1428445099
pkgrel=1
pkgdesc="Login wrapper to enable guest accounts"
url="https://github.com/GNU-Pony/ponyguests"
arch=(i686 x86_64)
license=(GPL3)
depends=(sh coreutils grep sed bc shadow 'linux>=3.4' glibc)
makedepends=(make coreutils 'linux-api-headers>=3.4' glibc gcc sed texinfo)
install=ponyguests.install
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(95105124ca7e4839f62e61352cddf416fe6aad761dc9558bef775787d7d863ce)

build() {
	cd "${srcdir}/ponyguests-${pkgver}"
	
	make PKGNAME="${pkgname}"
}

package() {
	cd "${srcdir}/ponyguests-${pkgver}"
	
	make PKGNAME="${pkgname}" DESTDIR="${pkgdir}" install
	
	_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf -- "/usr/share/licenses/common/GPL3" "${_dir}/LICENSE"
}

