# Maintainer: Rémi BERTHO <remi.bertho@dalan.fr>
# Contributor: Rémi BERTHO <remi.bertho@dalan.fr>
pkgname=libcsuper
pkgver=4.4.0
pkgrel=1
pkgdesc="Universal points counter allowing reflexion exemption - Library"
arch=(any)
url="https://www.dalan.fr"
license=('GPL')
depends=('libxml++' 'glibmm' 'muparser' 'podofo' 'cairo')
optdepends=('csuper-cli' 'csuper-gtk')
makedepends=('cmake')
install="INSTALL"
source=(https://www.binaries.dalan.fr/Csuper/$pkgver/csuper-$pkgver-sources.tar.xz)
sha512sums=('59a03fc63f6c1d778ce506f626c1ff9e5f7e6923db6ac8fb71ccada19523489411bd016f2819480bb3cc5dd49ab44b1a492206e2472720e3fe45557227870256')
 
build()
{
    cd "$srcdir/csuper-$pkgver-sources"
    cmake -G"Unix Makefiles" \
    	-DALL_UPDATES=FALSE \
    	-DCMAKE_BUILD_TYPE=Release \
   		-DCMAKE_INSTALL_PREFIX=/usr \
    	-DCMAKE_SKIP_RPATH=True \
    	-DCLI=FALSE \
    	-DGTK=FALSE \
    	-DLIBXMLPP=3.0 || return 1
    make || return 1
    sh utility.sh -c
}

package()
{
	cd "$srcdir/csuper-$pkgver-sources"
 	make install DESTDIR="${pkgdir}"
}
