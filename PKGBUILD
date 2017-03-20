# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: schuay <jakob dot gruber at gmail dot com>

pkgname=maitreya
_pkgname=maitreya8
pkgver=8.0.beta3
pkgrel=1
pkgdesc='A free software for Vedic and western astrology'
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.saravali.de/maitreya.html"
depends=('wxgtk')
source=("https://github.com/martin-pe/maitreya8/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('a41d227f7f65694cb46314edfc59a242')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	LDFLAGS+="-lfontconfig" ./configure --prefix=/usr  --with-wx-config=/usr/bin/wx-config
	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install

	# install font in the correct place
	mkdir -p ${pkgdir}/usr/share/fonts/TTF/ 
	mv ${pkgdir}/usr/share/fonts/truetype/maitreya/Saravali.ttf ${pkgdir}/usr/share/fonts/TTF/ && \
	rmdir ${pkgdir}/usr/share/fonts/truetype/maitreya && \
	rmdir ${pkgdir}/usr/share/fonts/truetype
}

