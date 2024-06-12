# Maintainer : Kitestramuort <kitestramuort@autistici.org>

pkgname=harp
pkgver=1.22
pkgrel=1
pkgdesc="Data harmonization toolset for scientific earth observation data"
arch=('x86_64')
url="https://github.com/stcorp/harp"
license=('BSD')
depends=('python' 'hdf4' 'hdf5' 'r' 'stc-coda')
provides=('harp')
source=("https://github.com/stcorp/harp/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('ccdbb5af56b11108db49390bc796f9f0')

build() {
	cd ${pkgname}-${pkgver}
	CFLAGS=-I/usr/include/R ./configure --prefix=/usr --libdir=/usr/lib --enable-R --enable-python --with-hdf5 --with-hdf4=/opt/hdf4
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=${pkgdir} install
    	install -Dm 644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}"
}

