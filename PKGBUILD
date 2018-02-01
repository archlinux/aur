# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=kvazaar
pkgver=1.2.0
pkgrel=3
pkgdesc='An open-source HEVC encoder licensed under LGPLv2.1'
arch=('i686' 'x86_64')
url='http://ultravideo.cs.tut.fi/#encoder'
license=('LGPL2.1')
depends=('glibc' 'gcc-libs')
makedepends=('yasm')
provides=('libkvazaar.so')
conflicts=('kvazaar-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ultravideo/kvazaar/archive/v${pkgver}.tar.gz")
sha256sums=('480ecfd9b4d2b7d21b355e4a35fcf47b4db7a3b0315b6219d93733db42392bd9')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    ./autogen.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure \
        --prefix='/usr' \
        --enable-largefile \
        --enable-static='no' \
        --enable-shared='yes' \
        --enable-fast-install='yes' \
        --without-cryptopp
        
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
