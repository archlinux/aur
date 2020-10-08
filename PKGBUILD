# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=littleutils-full
pkgver=1.2.2
pkgrel=1
pkgdesc='Utilities for compression, file manipulation, text cleanup, and images/PDF optimization (with all features and extras)'
arch=('x86_64')
url='https://sourceforge.net/projects/littleutils/'
license=('custom')
depends=(
    # official repositories:
        'bash' 'dash' 'perl' 'python' 'gifsicle' 'ghostscript' 'img2pdf' 'imlib2'
        'libjpeg-turbo' 'libpng' 'pngcrush' 'poppler' 'bzip2' 'gzip' 'lzip' 'lzop'
        'xz' 'p7zip' 'wget' 'zstd'
    # AUR:
        'lzma_alone'
)
provides=('littleutils')
conflicts=('littleutils' 'file-rename-utils')
source=("https://sourceforge.net/projects/littleutils/files/littleutils-source/${pkgver}/littleutils-${pkgver}.tar.xz")
sha256sums=('0c1c892a9e59357e8aad6ff4ca1d63d7cc95f01f759c1f47f60f4e615d29076c')

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    cd "littleutils-${pkgver}"
    ./configure --prefix='/usr'
    make
}

package() {
    make -C "littleutils-${pkgver}" DESTDIR="$pkgdir" install{,-extra}
    install -D -m644 "littleutils-${pkgver}/LICENSES" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
