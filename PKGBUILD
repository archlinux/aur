# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=littleutils
pkgname=littleutils-full
pkgver=1.0.37
pkgrel=2
pkgdesc='Utilities for compression, file manipulation, text cleanup, and images/PDF optimization (with all features and extras)'
arch=('i686' 'x86_64')
url='http://littleutils.sourceforge.net/'
license=('custom')
depends=(
    # official repositories:
        'bash' 'dash' 'perl' 'python2' 'file' 'gifsicle' 'libjpeg-turbo' 'libpng'
        'pngcrush' 'bzip2' 'gzip' 'lzip' 'lzop' 'xz' 'p7zip' 'ghostscript' 'wget'
    # AUR:
        'lzma_alone'
)
provides=('littleutils')
conflicts=('littleutils')
source=("https://sourceforge.net/projects/littleutils/files/littleutils-source/${pkgver}/littleutils-${pkgver}.tar.xz")
sha256sums=('f846ab6d2793499c99472469a2a74d9e57ee336320700bd540e2bc6ab0ec76da')

build() {
    cd "${_srcname}-${pkgver}"
    
    ./configure --prefix='/usr'
    
    make
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    make DESTDIR="$pkgdir" install-extra
    
    install -D -m644 LICENSES "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES"
}
