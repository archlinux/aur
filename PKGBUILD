# Maintainer: Erik Sonnleitner <es@delta-xi.net>>
pkgname='sherlock'
pkgver='1.0'
pkgrel=2
pkgdesc="Plagiarism (similarity) checker for text files (essays, source-code, etc.)"
arch=('i686' 'x86_64')
url="http://sydney.edu.au/engineering/it/~scilect/sherlock/"
license=('unknown')
depends=()
makedepends=()
source=("http://www.cs.usyd.edu.au/~scilect/sherlock/sherlock.c"
 "http://www.cs.usyd.edu.au/~scilect/sherlock/makefile")
md5sums=('8a934f9ee832a9c8e771c9094eb22a61'
         '7f8cb054713da2307f9c7a7a3346a575')

prepare() {
	cd $srcdir
	cp makefile makefile.patched
	echo -e "install:\n\tmkdir -p \$(DESTDIR)/usr/bin\n\tinstall -m 0755 \$(PROGRAM) \$(DESTDIR)/usr/bin/" >> makefile.patched
	sed -i '/^CFLAGS/ s/$/ -fPIC -fPIE/' makefile.patched
}

build() {
	make -f makefile.patched DESTDIR="$pkgdir"
}

package() {
	make -f makefile.patched DESTDIR="$pkgdir" install
}

#pkgver() {
#	cd "$pkgname-$pkgver"
#	printf "r%s" "$(bzr revno)"
#}
