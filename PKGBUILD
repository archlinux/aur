# Maintainer:Martin C. Doege <mdoege at compuserve dot com>
# Contributor: schuay <jakob dot gruber at gmail dot com>

pkgname=maitreya
pkgver=7.1.1
pkgrel=1
pkgdesc='A free software for Vedic and western astrology'
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.saravali.de/maitreya.html"
depends=('wxgtk')
source=("https://github.com/martin-pe/maitreya7/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
install='maitreya.install'
md5sums=('7983ce4020c33c3f60bd8b0230e0d4c8')

build() {
cd ${srcdir}/${pkgname}-${pkgver}

LDFLAGS+="-lfontconfig" ./configure --prefix=/usr  --with-wx-config=/usr/bin/wx-config
make
}

package() {
cd ${srcdir}/${pkgname}-${pkgver}

make DESTDIR=${pkgdir} install

# install font in the correct place
mkdir -p ${pkgdir}/usr/share/fonts/TTF/ 
mv ${pkgdir}/usr/share/fonts/truetype/maitreya/MaitreyaSymbols.TTF ${pkgdir}/usr/share/fonts/TTF/ && \
rmdir ${pkgdir}/usr/share/fonts/truetype/maitreya && \
rmdir ${pkgdir}/usr/share/fonts/truetype
}
