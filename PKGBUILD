# VHF voice radio plugin for SDR++
# Maintainer: confestim (con@confest.im)
# Author: cropinghigh
pkgname=sdrpp-vhfvoiceradio-git
pkgver=r12.30036cf
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="VHF voice radio plugin for SDR++"
license=('GPL')
depends=('sdrpp-git' 'itpp')
makedepends=('git' 'cmake' 'sdrpp-headers-git' 'libosmocore' 'unzip' 'lapack' 'blas' 'fftw')
provides=('sdrpp-vhfvoiceradio')
conflicts=('sdrpp-vhfvoiceradio')
source=("git+https://github.com/cropinghigh/sdrpp-vhfvoiceradio")
url="https://github.com/cropinghigh/sdrpp-vhfvoiceradio"
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/sdrpp-vhfvoiceradio"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/sdrpp-vhfvoiceradio"
    
    mkdir -p build
    cd build

    cmake .. \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5  \
        -DCMAKE_CXX_FLAGS="-Wno-format-security -Wno-return-type" 
    make
}

package() {
    cd "$srcdir/sdrpp-vhfvoiceradio/build"
    make DESTDIR=$pkgdir install
    find $pkgdir -type f

}