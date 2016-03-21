# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname=mkcue
_baseversion=1
_debianpkgrel=5
pkgver=${_baseversion}_${_debianpkgrel}
pkgrel=1
pkgdesc="generates a cue sheet from a cd"
arch=('i686' 'x86_64' 'armv7h')
url="https://packages.debian.org/sid/mkcue"
license=('LGPL')
makedepends=('quilt')
source=("http://httpredir.debian.org/debian/pool/main/m/mkcue/mkcue_${_baseversion}.orig.tar.gz"
        "http://httpredir.debian.org/debian/pool/main/m/mkcue/mkcue_${_baseversion}-${_debianpkgrel}.debian.tar.xz")
sha256sums=('2aaf57da4d0f2e24329d5e952e90ec182d4aa82e4b2e025283e42370f9494867'
            '5e2d8caaef001807557e72dd97caa5b4353b6d0473d15b0187397015f1d468e7')

prepare() {
       	cd "${pkgname}-${_baseversion}.orig"
        ln -s $srcdir/debian/patches patches
	quilt push -a
}

build() {
	cd "${pkgname}-${_baseversion}.orig"
	./configure --prefix=/usr
	echo $CFLAGS
	echo $CXXFLAGS
	echo $MAKEFLAGS
	make
}

package() {
	cd "${pkgname}-${_baseversion}.orig"
	install -D mkcue $pkgdir/usr/bin/mkcue
}
