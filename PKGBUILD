# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=ski-ia64-simulator
_pkgname=ski
pkgver=1.3.2
pkgrel=1
pkgdesc="Itanium 2 (ia64) instruction set simulator"
url="http://ski.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('gperf')
source=("https://sourceforge.net/projects/${_pkgname}/files/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
    "ski.patch")
md5sums=('fa511f222d246e9a7578106db75fd6a5'
    '5e61944fb3ed1e960db74fc3c95f590c')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p0 <../ski.patch
	./autogen.sh --disable-maintainer-mode --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make "DESTDIR=${pkgdir}" install
	msg "Installing documentation"
}
