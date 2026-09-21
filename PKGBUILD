# Maintainer: Mickaël Gastineau <Mickael.Gastineau@obspm.fr>
pkgname=calceph
pkgver=5.0.1
pkgrel=1
pkgdesc='The library is designed to access the binary planetary ephemeris files, such INPOPxx and JPL DExxx ephemeris files'
url='https://calceph.imcce.fr/'
license=('CECILL-C' 'CECILL-B' 'CECILL-2.1')
arch=('x86_64')
depends=('glibc'  'gcc-libs')
makedepends=('cmake>=3.12' 'gcc' 'gcc-fortran')
source=("https://calceph.imcce.fr/releases/calceph-${pkgver}.tar.gz")
sha256sums=('923d5db2fca10636b64e5529552edf1de8bd3da1da3cc7ac963ae6c3895a31ae')


build() {
    cd "$pkgname-$pkgver"
    cmake -B build -S . -DBUILD_SHARED_LIBS=ON  -DCMAKE_INSTALL_PREFIX='/usr'  -Wno-dev 
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    ctest --test-dir build --output-on-failure
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    install --mode=644 -D -t "$pkgdir/usr/share/licenses/${pkgname}/" LICENSE COPYING_* 
}
