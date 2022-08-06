# Maintainer : Kitestramuort <kitestramuort@autistici.org>

pkgname=harp
pkgver=1.15.1
pkgrel=1
pkgdesc="Data harmonization toolset for scientific earth observation data"
arch=('x86_64')
url="https://www.stcorp.nl"
license=('BSD')
depends=('python' 'hdf4' 'hdf5' 'r' 'stc-coda')
provides=('harp')
source=("https://github.com/stcorp/harp/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('b0bbb6aab6719e94db128126457fd8a2')


build() {
	cd ${pkgname}-${pkgver}
	CFLAGS=-I/usr/include/R ./configure --prefix=/usr --libdir=/usr/lib --enable-R --enable-python --with-hdf5 --with-hdf4=/opt/hdf4
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR=${pkgdir} install
    	install -Dm 644 "../src/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}"
}

