# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Hongbin Ma <mathmhb@gmail.com>
pkgname=cct
pkgver=1.44
pkgrel=1
epoch=
pkgdesc="CCT: A Chinese Characters Typesetting System for LaTeX"
arch=(any)
url=""
license=('GPL')
groups=()
depends=(texlive-bin)
makedepends=(fontforge cvs)
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
noextract=()
validpgpkeys=()

prepare() { 
	#cd "$pkgname-$pkgver"
	pwd
	mkdir _tmp||echo Subfolder _tmp is created to hold source files.
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
