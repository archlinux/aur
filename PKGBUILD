# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.1.7
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azpainter.html"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
makedepends=('libxfixes')
source=("http://azsky2.html.xdomain.jp/arc/azpainter-2.1.7.tar.xz"
        "${pkgname}-${pkgver}-translations.patch")

sha256sums=('62e0ce810ada061864c728dbb7dd8c3eb7398566657d758442e9fd33b3db5cb4'
            'b0ed4040480a8a4c5fea5b754b8f11c7925371ececa7dcee6d5416fb85a829fd')


prepare() {
	cd ${pkgname}-${pkgver}
	# fixing translations
	
	patch -Np1 -i ../"${pkgname}-${pkgver}-translations.patch"
	
	cd translation
	make
	./mtrconv en en.mtr
	./mtrconv ru ru.mtr
	./mtrconv uk uk.mtr
}


build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	# make -j1
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
	cp -f translation/*.mtr ${pkgdir}/usr/share/azpainter/tr/
}

