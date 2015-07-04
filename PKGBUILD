# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>
# Maintainer:  Frank Schäffer <frank.schaeffer@o2online.de>
pkgname=nco
pkgver=4.4.8
pkgrel=1
pkgdesc="netCDF Operators allow users to manipulate and analyse data stored in NetCDF files"
url="http://nco.sourceforge.net/"
license="GPL"
depends=('netcdf' 'udunits' 'gsl')
makedepends=('antlr2')
arch=('i686' 'x86_64')
options=('!libtool')
source=(http://nco.sourceforge.net/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('842a118251da3875e7e2ab2cb0ec77fe')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    sed -i configure -e 's/runantlr/runantlr2/g'
    ./configure --prefix=/usr \
                --enable-netcdf-4 \
                --enable-gsl \
                --enable-ncoxx \
                --enable-udunits2 \
                --enable-optimize-custom \
                || return 1
    make || return 1
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install install-html || return 1
}
# vim:set ts=4 sw=4 et:
