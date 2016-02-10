# Maintainer: Rich Li <rich@dranek.com>
pkgname=h4cflib
pkgver=1.1
pkgrel=1
pkgdesc="HDF4 CF Conversion Toolkit"
arch=('i686' 'x86_64')
url="http://www.hdfeos.org/software/h4cflib.php"
license=('custom')
depends=('hdf-eos5' 'hdf-eos2')
# Technically, hdf5 is needed, not hdf-eos5. However, libGctp is provided by hdf-eos5 instead of hdf-eos2 or in a separate package.
source=("http://www.hdfeos.org/software/h4cflib/${pkgname}_$pkgver.tar.gz")
sha256sums=("aa521ffcaf97b960fe0e26d29077a17af972be1e5c9b9afa3127441439c3d508")

build() {
    cd "${pkgname}_$pkgver"
    ./configure \
        --prefix=/usr \
        --with-hdf4=/usr \
        --with-hdf5=/usr \
        --with-netcdf=/usr \
        --with-hdfeos2=/usr
    make
}

check() {
    cd "${pkgname}_$pkgver"
    make -k check
}

package() {
    cd "${pkgname}_$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

