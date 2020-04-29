# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.1.6
pkgrel=2
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/soft/azpainter.html"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
makedepends=('libxfixes')
source=("http://azsky2.html.xdomain.jp/arc/azpainter-2.1.6-200428.tar.xz"
        "${pkgname}-${pkgver}-translations.patch")

sha256sums=('7c63f1115fbe9ee6590d7d045aba3fda10eb71b6718ff1d857b4c49267efaae4'
            '579fc7ebdc025d91a5fe450941b4ca5a50084ae89e686f5d205098758a5e7f95')


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

