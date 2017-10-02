# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=xf86-input-tslib
pkgver=1.1.1
pkgrel=1
pkgdesc='X.org tslib input driver'
arch=(arm i686 x86_64)
license=('custom:MIT')
url='https://github.com/merge/xf86-input-tslib'
depends=('glibc' 'tslib')
makedepends=('xorg-server-devel')
options=('!libtool')
groups=('xorg-drivers')
validpgpkeys=('F2082B880F9E423934686E3F500398DF5AB387D3') # Martin Kepplinger <martink@posteo.de>
source=("https://github.com/merge/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha256sums=('8b6a9f2ad73598a3619e66e252bd54b1792c4deba0213101fa4d272b5e9217ec'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

