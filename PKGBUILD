# Maintainer: katoh <katoh_at_mikage.ne.jp>

pkgname=azpainter
pkgver=1.0.6
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libx11' 'libxext' 'libxft' 'libxi' 'zlib')
source=("http://osdn.jp/frs/redir.php?m=iij&f=/azpainter/63501/azpainter-1.0.6.tar.bz2")
md5sums=("b60831703efa395583d818fa502e48d2")

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
