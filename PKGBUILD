# Maintainer: Dino Morelli < dino@ui3.info >
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=glulxe-term
pkgver=054
pkgrel=1
pkgdesc="Glulxe is an interpreter for the Glulx virtual machine."
arch=(i686 x86_64)
url="http://www.eblong.com/zarf/glulx/"
license=('BSD')
groups=(inform)
depends=('ncurses')
source=("http://www.ifarchive.org/if-archive/programming/glulx/interpreters/glulxe/glulxe-${pkgver}.tar.gz" "http://www.ifarchive.org/if-archive/programming/glk/implementations/glktermw-104.tar.gz")

md5sums=('ce96007d8d585c4f50cca76cf0d57cb9'
         '050aeb964140f7e11f555e06a23ccb1d')

build() {
   cd $srcdir/glkterm
	sed -i -e "s/<ncursesw\/ncurses.h>/<ncurses.h>/g" $srcdir/glkterm/gtncursesw.c
	make
	# note: glktermw is a portable API (programming interface)
	# for applications with text UIs (user interfaces).
	# It is needed to compile glulxe
	
   cd $srcdir/glulxe
   make GLKINCLUDEDIR=$srcdir/glkterm GLKLIBDIR=$srcdir/glkterm GLKMAKEFILE=Make.glktermw || return 1
}

package() {
   install -D -m644 $srcdir/glulxe/glulxe $pkgdir/usr/bin/glulxe-term
	chmod +x $pkgdir/usr/bin/glulxe-term
}
