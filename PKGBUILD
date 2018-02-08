# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Johannes Dewender <arch@JonnyJD.net>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbasename=schroedinger
pkgname=lib32-"$_pkgbasename"
pkgver=1.0.11
pkgrel=3
pkgdesc='An implemenation of the Dirac video codec in ANSI C code (32 bit)'
arch=('x86_64')
url='https://launchpad.net/schroedinger/'
license=('GPL2' 'LGPL2.1' 'MPL' 'MIT')
depends=('lib32-orc' 'lib32-gcc-libs' "$_pkgbasename")
source=("http://launchpad.net/${_pkgbasename}/trunk/${pkgver}/+download//${_pkgbasename}-${pkgver}.tar.gz")
sha256sums=('1e572a0735b92aca5746c4528f9bebd35aa0ccf8619b22fa2756137a8cc9f912')

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    
    cd "${_pkgbasename}-${pkgver}"
    
    ./configure \
        --prefix='/usr' \
        --libdir='/usr/lib32' \
        --enable-shared='yes' \
        --enable-static='no' \
        --enable-fast-install \
        --enable-largefile \
        --enable-encoder \
        --enable-motion-ref \
        --with-thread='auto'
    
    make
}

package() {
    cd "${_pkgbasename}-${pkgver}"
    
    make DESTDIR="${pkgdir}" install
    
    rm -rf "${pkgdir}"/usr/{include,share}
    
    install -D -m644 COPYING.MIT "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.MIT"
}
