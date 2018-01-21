# Maintainer: Rémi BERTHO <remi.bertho@dalan.fr>
# Contributor: Rémi BERTHO <remi.bertho@dalan.fr>
pkgname=csuper-gtk
pkgver=4.4.1
pkgrel=1
pkgdesc="Universal points counter allowing reflexion exemption - GTK version"
arch=(any)
url="https://www.dalan.fr"
license=('GPL')
depends=('libxml++' 'glibmm' 'muparser' 'podofo' 'cairo' 'ncurses' 'libcsuper' 'gtkmm3')
makedepends=('cmake')
install="INSTALL"
source=(https://www.binaries.dalan.fr/Csuper/$pkgver/csuper-$pkgver-sources.tar.xz)
sha512sums=('2ac8906142c91509814719b843b4047ed9c30200531de973beced4551bf225e112e22c3457c156309c33b036752647c12380fa51e9e46a3e363310bea35a10f1')
 
build()
{
    cd "$srcdir/csuper-$pkgver-sources"
    cmake -G"Unix Makefiles" \
    	-DALL_UPDATES=FALSE \
    	-DCMAKE_BUILD_TYPE=Release \
   		-DCMAKE_INSTALL_PREFIX=/usr \
    	-DCMAKE_SKIP_RPATH=True \
    	-DLIB=FALSE \
    	-DCLI=FALSE \
    	-DLIBXMLPP=3.0 || return 1
    make || return 1
    sh utility.sh -c
}

package()
{
	cd "$srcdir/csuper-$pkgver-sources"
 	make install DESTDIR="${pkgdir}"
}
