# Maintainer: katoh <katoh_at_mikage.ne.jp>

pkgname=azpainter
pkgver=1.0.5
pkgrel=2
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libx11' 'libxext' 'libxft' 'libxi' 'zlib')
source=("http://osdn.jp/frs/redir.php?m=iij&f=/azpainter/62214/${pkgname}-${pkgver}-src.tar.bz2")
md5sums=("213c5f86fdf24fe29382ac125d2e281a")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i 's/\/local$/\nifdef DESTDIR\n\tprefix=$(DESTDIR)\/usr\nendif/' Makefile
	sed -i 's/axt/axt .\/README .\/NEWS/' Makefile 
	make -j1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
