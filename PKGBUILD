# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbasename=lame
pkgname=lib32-"${_pkgbasename}"
pkgver=3.100
pkgrel=1
pkgdesc='A high quality MPEG Audio Layer III (MP3) encoder (32 bit)'
arch=('x86_64')
url='http://lame.sourceforge.net/'
depends=('lib32-ncurses' "${_pkgbasename}")
makedepends=('nasm')
license=('LGPL')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz")
sha256sums=('ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e')

build() {
    cd "${_pkgbasename}-${pkgver}"
    
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
    ./configure \
        --prefix='/usr' \
        --libdir='/usr/lib32' \
        --enable-shared='yes' \
        --enable-static='no' \
        --enable-fast-install \
        --enable-nasm
    
    make
}

package() {
    cd "${_pkgbasename}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    rm -rf "$pkgdir"/usr/{bin,include,share}
}
