# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=("php7-pdlib")
_pkgbase=("pdlib")
pkgver=1.0.2
pkgrel=2
pkgdesc="PDlib - A PHP extension for Dlib"
arch=('x86_64')
url="https://github.com/goodspb/pdlib"
license=('MIT License')
depends=('dlib'
         'php7'
         'libx11'
         'openblas'
	 'cblas'
         'lapack'
	 'libsm'
	 'libice'
         'libxext'
         'giflib4'
	 'libpng'
	 'zlib'
 	 'libjpeg-turbo'
	 'sqlite'
	 'fftw'
         )

makedepends=('cmake')
source=("https://github.com/goodspb/pdlib/archive/v$pkgver.tar.gz"
	"pdlib.ini")
sha256sums=('e91a3c7396ee2027f957fa34fcc2567e614e4e1c1570ae7d5d16d4203541ba4a'
            'c325ddedc2e685f12119a0f4e8a1a45430a1ecb15368179f4c0c7153352b8a0e')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    phpize7
    LDFLAGS="-L/usr/lib/giflib4" CXXFLAGS="-O2 -I/usr/include/giflib4" ./configure --with-libdir=/usr/lib/giflib4
    make
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make NO_INTERACTION=1 test
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    install -Dm755 "modules/pdlib.so" "${pkgdir}/usr/lib/php7/modules/pdlib.so"
    # install ini file
    install -Dm644 "../pdlib.ini" "${pkgdir}/etc/php7/conf.d/pdlib.ini"
}

