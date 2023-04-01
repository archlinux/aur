# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributer: Jason Chu <jchu@xentac.net>

pkgname=gprolog
pkgver=1.5.0
pkgrel=2
pkgdesc="GNU Prolog"
arch=('x86_64')
url="http://www.gprolog.org/"
depends=('glibc')
license=('GPL')
options=('staticlibs' '!lto')
source=("https://ftp.gnu.org/gnu/gprolog/gprolog-$pkgver.tar.gz")
sha256sums=('670642b43c0faa27ebd68961efb17ebe707688f91b6809566ddd606139512c01')

build() {
   cd "$srcdir/gprolog-$pkgver/src"
   CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
   ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-c-flags="$CFLAGS -fPIC" --disable-regs
   make
}

package() {
   cd "$srcdir/gprolog-$pkgver/src"
   make install \
	INSTALL_DIR="$pkgdir"/usr/share/gprolog \
	LINKS_DIR="$pkgdir"/usr/bin \
	DOC_DIR="$pkgdir"/usr/share/gprolog/doc \
	HTML_DIR="$pkgdir"/usr/share/gprolog/doc/Html \
	EXAMPLES_DIR="$pkgdir"/usr/share/gprolog \
	sysconfdir="$pkgdir"/etc \
	localstatedir="$pkgdir"/var
   cd "$pkgdir"/usr/bin
   rm *
   ln -s /usr/share/gprolog/bin/fd2c
   ln -s /usr/share/gprolog/bin/gplc
   ln -s /usr/share/gprolog/bin/gprolog
   ln -s /usr/share/gprolog/bin/hexgplc
   ln -s /usr/share/gprolog/bin/ma2asm
   ln -s /usr/share/gprolog/bin/pl2wam
   ln -s /usr/share/gprolog/bin/wam2ma
}
