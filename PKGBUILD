# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cct
pkgver=1.44
pkgrel=1
epoch=
pkgdesc="CCT: "
arch=(any)
url=""
license=('GPL')
groups=()
depends=()
makedepends=(fontforge)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
#source=("$pkgname-$pkgver.tar.gz")
#source=("cct::cvs+:pserver:anonymous@lsec.cc.ac.cn:/cvsroot/")
noextract=()
#md5sums=()
validpgpkeys=()

prepare() { 
	#cd "$pkgname-$pkgver"
	pwd
	mkdir _tmp
	cd _tmp
	echo Please type ENTER directly when prompting CVS password ...
	cvs -d :pserver:anonymous@lsec.cc.ac.cn:/cvsroot/cct login
	cvs -d :pserver:anonymous@lsec.cc.ac.cn:/cvsroot/cct co .
	cd ..
	mkdir "$pkgname-$pkgver"
	mv _tmp/cct/* "$pkgname-$pkgver"/
	rm -r _tmp
}

build() {
	cd "$pkgname-$pkgver"
	make all CPATH=":/usr/lib" OBJS=fullpath.o
}

check() { 
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=usr/local install_root="$pkgdir"/ install
}
