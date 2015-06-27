# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=aspcud
groups=('potassco')
pkgver=1.9.1
pkgrel=1
pkgdesc="Solver for package dependencies"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://potassco.sourceforge.net/"
license=('GPL3')
depends=('clasp>=2.1.3' 'gringo>=4.2.1')
conflicts=('aspcud-svn')
makedepends=('boost' 'cmake' 're2c')
source=(
    "http://downloads.sourceforge.net/project/potassco/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.gz"
)
sha1sums=(db1ce85814699fb77aff41f4f6df0721d6851756)

build() {
    cd "$srcdir/$pkgname-$pkgver-source"
    mkdir -p build/release
    cd build/release
    cmake \
	-DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DCUDF2LP_LOC=cudf2lp \
    	-DGRINGO_LOC=gringo \
	-DCLASP_LOC=clasp \
	-DCMAKE_BUILD_TYPE=Release ../..
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver-source"
    cd build/release
    make DESTDIR=${pkgdir} install
}
