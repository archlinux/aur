# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=gp2c
pkgver=0.0.12
_pkgver=${pkgver/.pl/pl}
pkgrel=1
pkgdesc='Translates GP scripts to PARI programs'
url='http://pari.math.u-bordeaux.fr/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('pari')
makedepends=('perl')
validpgpkeys=('42028EA404A2E9D80AC453148F0E7C2B4522E387')
source=("${url}pub/pari/GP2C/${pkgname}-${_pkgver}.tar.gz"{,.asc})
sha256sums=('ee9ff63979670408d8c293902ce7ff6a825145f0e7e7c6323764733ef1b9310d'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${_pkgver}"
	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--with-paricfg=/usr/lib/pari/pari.cfg \
		--with-perl \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${_pkgver}"
	make DESTDIR="${pkgdir}" install
}
