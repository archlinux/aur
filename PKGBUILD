pkgname=mkcue
_baseversion=1
_debianpkgrel=8
pkgver=${_baseversion}_${_debianpkgrel}
pkgrel=1
pkgdesc="generates a cue sheet from a cd"
arch=('i686' 'x86_64' 'armv7h')
url="https://packages.debian.org/sid/mkcue"
license=('LGPL')
makedepends=('quilt')
source=("https://httpredir.debian.org/debian/pool/main/m/mkcue/mkcue_${_baseversion}.orig.tar.gz"
        "https://httpredir.debian.org/debian/pool/main/m/mkcue/mkcue_${_baseversion}-${_debianpkgrel}.debian.tar.xz")
sha256sums=('2aaf57da4d0f2e24329d5e952e90ec182d4aa82e4b2e025283e42370f9494867'
            '8e3556ff44a5993ea0d370809e067079c7a07b128d430193617270e1696b0665')

prepare() {
	cd "${pkgname}-${_baseversion}.orig"
	ln -s $srcdir/debian/patches patches
	quilt push -a
}

build() {
	cd "${pkgname}-${_baseversion}.orig"
	export CXXFLAGS=-std=gnu++98
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${_baseversion}.orig"
	install -D mkcue $pkgdir/usr/bin/mkcue
}
