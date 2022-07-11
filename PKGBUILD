#Maintainer: AtomAlpaca <atal@anche.no>

pkgname=netrek-client-cow-git
pkgver=3.3.1
pkgrel=1
pkgdesc='A client for the multi-player game of Netrek'
arch=('x86_64')
url='https://www.netrek.org/'
license=('custom')
depends=('libx11' 'sdl' 'sdl_mixer' 'libxxf86vm' 'libxpm' 'imlib' 'gmp')
source=('git+https://github.com/quozl/netrek-client-cow.git')
sha256sums=('SKIP')
makedepends=('git')

build() {
	cd $srcdir/netrek-client-cow
	sh autogen.sh --prefix=/usr --BINDIR=/usr/bin
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/netrek-client-cow
	install -Dm775 netrek-client-cow "${pkgdir}/usr/bin/netrek-client-cow"
	mkdir -p $pkgdir/usr/share/pixmaps/netrek-client-cow
	cp -pr pixmaps/* $pkgdir/usr/share/pixmaps/netrek-client-cow/
	sed -i "s/\/usr\/games/\/usr\/bin/" netrek-client-cow.desktop
	install -Dm775 netrek-client-cow.desktop $pkgdir/usr/share/applications/netrek-client-cow.desktop
}
