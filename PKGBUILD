# Maintainer: Richard Macwan <rich4rd.macwan AT gmail>

pkgname=ncurses5
pkgver=5.9
_pkgseries=5.9
pkgrel=1
pkgdesc="NCurses 5.9 for backward compatibility (e.g. for Matlab)"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/ncurses/"
license=('GPL' 'LGPL' 'MIT')
depends=()
conflicts=(ncurses5-compat-libs)
makedepends=('make' 'intltool')
source=("http://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz")
sha256sums=('9046298fb440324c9d4135ecea7879ffed8546dd1b58e59430ea07a4633f563b')
prepare(){
	tar -xvf ../"ncurses-${pkgver}".tar.gz	
}

build() {
	cd "ncurses-${pkgver}"
	#sed -i configure -e "s/-static//"
	#sed -i Makefile.os2 -e "s/CONFIG_OPTS	= --enable-termcap/CONFIG_OPTS	= --disable-termcap/" -e "s/install.os2 : install.emxdata install.libs install.progs/install.os2 : install.libs/"
	./configure --with-shared CPPFLAGS=-P
	make -j8
}

package() {
  	cd "ncurses-${pkgver}"
  	#make DESTDIR="${pkgdir}" install
  	#install -m644 "${pkgdir}"/usr/lib/libcurses.a /usr/lib/libcurses.so.5
	mkdir -p "${pkgdir}"/usr/lib
	cp lib/libncurses.so.5.9 "${pkgdir}"/usr/lib
	cd "${pkgdir}"/usr/lib
	ln -s libncurses.so.5.9 libncurses.so.5
}
