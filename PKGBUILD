# Maintainer: Sidney Kuyateh <autinerd-arch at kuyateh dot eu>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Tod Jackson <tod.jackson@gmail.com>
# Contributor: Michael Armbruster <michael at armbrust dot me>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libbluray
pkgname=lib32-${_pkgname}
pkgver=1.3.4
pkgrel=1
pkgdesc='A library to access Blu-Ray disks for video playback (32 bit)'
arch=('x86_64')
url='https://www.videolan.org/developers/libbluray.html'
license=('LGPL2.1')
depends=("${_pkgname}" 'lib32-fontconfig' 'lib32-freetype2' 'lib32-gcc-libs' 'lib32-libxml2')
provides=('libbluray.so')
source=("https://download.videolan.org/pub/videolan/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('94dbf3b68d1c23fe4648c153cc2f0c251886fac0a6b6bbe3a77caabaa5322682f712afe4a7b6b16ca3f06744fbc0e1ca872209a32898dcf0ae182055d335aec1')

build() {
    cd ${_pkgname}-${pkgver}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure --prefix=/usr \
                --libdir=/usr/lib32 \
                --disable-doxygen-doc \
                --disable-bdjava-jar \
                --host=i686-unknown-linux-gnu
    make
}

package() {
    cd ${_pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
