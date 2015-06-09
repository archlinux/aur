 # Maintainer: saxonbeta <saxonbeta at gmail dot com>
pkgname=openms
_pkgname=OpenMS
pkgver=2.0.0
pkgrel=2
pkgdesc="C++ library and tools for LC/MS data management and analyses"
arch=('i686' 'x86_64')
url="http://open-ms.sourceforge.net/"
license=('BSD')
depends=('boost' 'libsvm' 'glpk' 'xerces-c' 'qtwebkit' 'eigen')
makedepends=('cmake')
optdepends=('dot2tex: Create package documentation during compilation'
	    'texlive-core: Create package documentation during compilation'
	    'texlive-latexextra: Create package documentation during compilation'
	    'doxygen: Create package documentation during compilation')
source=("http://download.sourceforge.net/project/open-ms/${_pkgname}/${_pkgname}-2.0/${_pkgname}-${pkgver}_src.tar.gz"
        'OpenMS-TOPPView.desktop' 'OpenMS-TOPPAS.desktop')
sha256sums=('957bbb28bf484b9e288986c103109298f9aeac8e4d5e68b8b58ac2e365d7ab3d'
	    '76fab06730720c786a0b874ba6bb8b85adae85b11dde9c68c35a0d3e76d7f049'
	    'ba63c4aa90b1c055141cb0ef5bd199e390912595e7fdb8d30e9bb777f189ca30')

	    


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  cd contrib
  cmake -DBUILD_TYPE=WILDMAGIC
  cmake -DBUILD_TYPE=SEQAN
  cd ..
  cmake -DBOOST_USE_STATIC=OFF -DINSTALL_PREFIX=/usr -DCMAKE_FIND_ROOT_PATH=/usr -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 $srcdir/OpenMS-TOPPView.desktop ${pkgdir}/usr/share/applications/OpenMS-TOPPView.desktop
  install -D -m644 $srcdir/OpenMS-TOPPAS.desktop ${pkgdir}/usr/share/applications/OpenMS-TOPPAS.desktop
}