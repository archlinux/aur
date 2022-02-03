# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}"
__pkgname="lib${_pkgname}"
pkgver=0.5.1
pkgrel=1
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs qt5-base zlib libzip openssl)
conflicts=(gourou-bin)
options=(!strip)
source=("gourou::git://soutade.fr/libgourou.git#tag=v$pkgver")
md5sums=(SKIP)

build() {
	cd $srcdir/gourou

	scripts/setup.sh
	make all
}

package() {
	cd $srcdir/gourou

	install -d $pkgdir/{usr/bin/,usr/lib/}
	cp -a --no-preserve=ownership utils/{acsmdownloader,adept_activate,adept_remove} $pkgdir/usr/bin
	cp -a --no-preserve=ownership *.so $pkgdir/usr/lib
}
