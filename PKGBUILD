# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=gr-hpsdr
pkgver=3.10
pkgrel=2
pkgdesc="interface module for HPSDR Hermes / Metis, and Red Pitaya (using OpenHPSDR protocol 1) "
arch=('x86_64' 'aarch64')
url="https://github.com/Tom-McDermott/gr-hpsdr"
license=('GPL2')
depends=('gnuradio' 'python-construct>=2.9' 'python-requests' 'boost')
optdepends=('doxygen: For document generation')
makedepends=('cmake')
conflicts=("${pkgname}")
source=("$url/archive/V$pkgver/$pkgname-$pkgver.tar.gz"
        "python_cmakefiles.patch")
sha256sums=('8e0f724c88fc9c4678eb8f78b2eae54e9ebbe875d43fe71bf934735eaa8d255a'
            'f320e17f2c2615ee5d5309b0bd82809f9d7744efe4e7f23520e2400f8d20f112')

prepare() {
    patch --directory="$pkgname-$pkgver" --forward --strip=0 --input="${srcdir}/python_cmakefiles.patch"
}

build() {
    cmake -B build -S $pkgname-$pkgver \
       -DCMAKE_BUILD_TYPE=Release \
       -DCMAKE_INSTALL_PREFIX=/usr \
       -DCMAKE_SKIP_RPATH=YES \
       -Wno-dev
  
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
