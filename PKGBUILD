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
sha512sums=('51fc47154c31325b0a2066df7f70330d6bc6a678505e065e7ae9bc259a04796c4607c5a809e36c097cf549766f3e9efdce59f98f02fbe68a295323bfa06a8901')
 
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
