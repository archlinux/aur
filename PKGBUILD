# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_srcname=littleutils
pkgname=littleutils-full
pkgver=1.0.39
pkgrel=1
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
sha256sums=('c24185a0752140f38b1c295bfad3f038fbeda2f1643cd83d7496130cc3a03160')

build() {
    cd "${_srcname}-${pkgver}"
    
    ./configure --prefix='/usr'
    
    make
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install{,-extra}
    
    install -D -m644 LICENSES -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
