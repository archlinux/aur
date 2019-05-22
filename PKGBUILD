# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=gp2c
pkgver=0.0.11.pl2
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
sha256sums=('2ffd9e3af9df86a1df8a0aa2ac4da1d96c85dbdf36cad375ad1bcfc70b701a73'
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
