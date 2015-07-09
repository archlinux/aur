# Maintainer: katoh <katoh_at_mikage.ne.jp>

pkgname=azdrawing
pkgver=1.5
pkgrel=1
pkgdesc="Painting software for line art and comics."
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libx11' 'libxext' 'libxft' 'libxi' 'zlib')
makedepends=('make')
source=("http://osdn.jp/frs/redir.php?m=iij&f=/azdrawing/63500/azdrawing-1.5.tar.bz2")
md5sums=("93941ba7344bba236f658fbd69d99cfb")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i 's/\/local$/\nifdef DESTDIR\n\tprefix=$(DESTDIR)\/usr\nendif/' Makefile
	sed -i 's/axt/axt .\/README .\/NEWS/' Makefile 
	sed -i 's/texture $(datadir)/texture $(datadir)\n\tcp -r .\/manual $(datadir)/' Makefile
	make -j1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
