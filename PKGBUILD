# Maintainer: katoh <katoh_at_mikage.ne.jp>

pkgname=azpainter
pkgver=1.0.7
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libx11' 'libxext' 'libxft' 'libxi' 'zlib')
source=("http://osdn.jp/frs/redir.php?m=iij&f=/azpainter/64397/azpainter-1.0.7.tar.bz2")
sha1sums=("30ca4c025b8d43bdbc1e8442aaae942f92f4e491")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i 's/\/local$/\nifdef DESTDIR\n\tprefix=$(DESTDIR)\/usr\nendif/' Makefile
	sed -i 's/axt/axt .\/README .\/NEWS/' Makefile
	sed -i '/-gtk-update-icon-cache/d' Makefile
	make -j1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
