# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: UshakovVasilii <UshakovVasilii@yahoo.com>
# Contributor: Charon77 <evans.jahja@yahoo.com>
# Contributor: debdj <debd92@gmail.com>

pkgname=florence
pkgver=0.6.3
pkgrel=3
pkgdesc='A configurable on-screen virtual keyboard'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/${pkgname}/"
license=('GPL-2.0-or-later')
depends=('gtk3' 'libxml2' 'librsvg' 'libxtst' 'gettext' 'gstreamer>=1.0') # http://florence.sourceforge.net/english/install.html
makedepends=('intltool>=0.23')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('c527e8c40c9a594106420a6187945d79dfa7ddb4f628805cd188c8a37f79f42cbc1f74b80e21186f104a79c4d5e90c7a9d93cbe35bf1c6ebfe874db047fbef3c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr \
		--without-notification \
		--without-at-spi \
		--with-panelapplet \
		--with-xtst \
		--with-docs \
		--disable-static \
		--without-docs
	make -j1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make -j1 DESTDIR="${pkgdir}" install
}
