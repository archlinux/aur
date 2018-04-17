# Maintainer: Benjamin Hodgetts <ben@xnode.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=xosd-ex
pkgver=2.2.14
pkgrel=8
pkgdesc="Displays text on your screen. On-Screen-Display-libs for some tools (with XFT patch)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://sourceforge.net/projects/libxosd/"
depends=('libxt' 'libxinerama' 'sh')
provides=('xosd')
conflicts=('xosd')
source=("http://downloads.sourceforge.net/libxosd/xosd-${pkgver}.tar.gz" "http://ftp.de.debian.org/debian/pool/main/x/xosd/xosd_$pkgver-2.debian.tar.gz" "xosd-2.2.14-xft.patch")
md5sums=('4b349fe930e4eee2f504d6c02673e24d' 'cd3c37f4e4bbfba6f3ffd7ec43256cc2' '5e525d29876a6936b11f20a6c3e2ddcc')

build() {
	cd "${srcdir}/xosd-${pkgver}"
	patch -p1 <"${srcdir}"/debian/patches/25_fix_mangapges.diff
	patch -p1 <"${srcdir}"/debian/patches/328676.diff
	patch -p1 <"${srcdir}"/xosd-2.2.14-xft.patch
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "${srcdir}/xosd-${pkgver}"
	make DESTDIR="${pkgdir}" install
	sed -i 's/AC_DEFUN(AM_PATH_LIBXOSD,/AC_DEFUN([AM_PATH_LIBXOSD],/' \
	"${pkgdir}/usr/share/aclocal/libxosd.m4"
}
