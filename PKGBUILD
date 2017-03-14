# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.0.4
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainter/index.html"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.bz2" "azpainter_transl.patch")
sha256sums=('6871dfe0256658424ed72675dff783863e1587a0f3a286ea3190e3cf3a2a10dd'
            'c7b702498bad94c585b4f42862abbfba68a0ec28ef7317b48ec3200a41581a86')

prepare() {
	# cd ${pkgname}-${pkgver}
	# fixing translations
	
	patch -Np0 -i azpainter_transl.patch
	
}

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	# make -j1
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install-strip
}
