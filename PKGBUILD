# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=("php74-pdlib")
_pkgbase=("pdlib")
pkgver=1.1.0
pkgrel=1
pkgdesc="PDlib - A PHP extension for Dlib"
arch=('x86_64')
url="https://github.com/goodspb/pdlib"
license=('MIT License')
depends=('dlib'
         'php74'
         'libx11'
         'blas'
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
sha256sums=('6c255c07dfb70d34019faecd99160d03846c83925452c9e93d5606edc8d55803'
            'c325ddedc2e685f12119a0f4e8a1a45430a1ecb15368179f4c0c7153352b8a0e')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    phpize74
    LDFLAGS="-L/usr/lib/giflib4" CXXFLAGS="-O2 -I/usr/include/giflib4" ./configure --with-libdir=/usr/lib/giflib4
    make
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make NO_INTERACTION=1 test
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    install -Dm755 "modules/pdlib.so" "${pkgdir}/usr/lib/php74/modules/pdlib.so"
    # install ini file
    install -Dm644 "../pdlib.ini" "${pkgdir}/etc/php74/conf.d/pdlib.ini"
}

