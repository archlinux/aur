# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libcoverart-git
_pkgname=libcoverart
pkgver=r73.55f5ec0
pkgrel=1
pkgdesc="C/C++ library for accessing the MusicBrainz Cover Art Archive"
arch=('i686' 'x86_64')
url="http://musicbrainz.org/doc/libcoverart"
license=('LGPL')
depends=('neon' 'jansson')
conflicts=('libcoverart')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/metabrainz/${_pkgname}.git")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	# Use the number of revisions
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build()
{
	cd "${srcdir}/${pkgname}"

	cmake . \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package()
{
	cd "${srcdir}/${pkgname}"

	make DESTDIR="${pkgdir}" install
}
