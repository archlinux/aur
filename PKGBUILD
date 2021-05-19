# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=libchadstr-git
pkgver=1
pkgrel=1
pkgdesc="The Chad way to handle strings in C"
arch=(any)
url="https://github.com/skullchap/chadstr"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'git')
provides=('libchadstr')
source=("git+https://github.com/skullchap/chadstr")
md5sums=('SKIP')
_gitdir="chadstr"

build() {
	cd "$srcdir/$_gitdir"
	echo '#include "chadstr.h"' > dummy.c
	gcc dummy.c -fPIC -shared -o libchadstr.so -O3 -I.
}

package() {
	cd "$srcdir/$_gitdir"
	mkdir -p $pkgdir/usr/include
	mkdir -p $pkgdir/usr/lib
	cp chadstr.h $pkgdir/usr/include/chadstr.h
	chmod 755 $pkgdir/usr/include/chadstr.h
	cp libchadstr.so $pkgdir/usr/lib/libchadstr.so
	chmod 755 $pkgdir/usr/lib/libchadstr.so
}
