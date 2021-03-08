# Maintainer: Rihards Skuja <rhssk at posteo dot eu>
# Contributor: Masoud <mpoloton@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=soapyrtlsdr-git
pkgver=0.3.2.r1.g8277756
pkgrel=1
pkgdesc="SoapySDR RTL-SDR Support Module"
arch=('any')
url="https://github.com/pothosware/SoapyRTLSDR"
license=('MIT')
depends=('soapysdr' 'rtl-sdr')
makedepends=('git' 'cmake')
provides=('soapyrtlsdr')
conflicts=('soapyrtlsdr')
source=("$pkgname::git+https://github.com/pothosware/SoapyRTLSDR.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/^soapy-rtl-sdr-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -C build
}

package() {
    make -C "$srcdir/$pkgname/build" DESTDIR="$pkgdir" install
}

