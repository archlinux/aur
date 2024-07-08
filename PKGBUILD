# Contributor: Kyle Keen <keenerd@gmail.com>
# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=littleutils
pkgver=1.2.6a
pkgrel=1
pkgdesc='Utilities for compression, file manipulation, text cleanup, and images/PDF optimization'
arch=('x86_64')
url='https://sourceforge.net/projects/littleutils/'
license=('LicenseRef-Custom')
depends=(
    # official repositories:
        'bash' 'perl' 'perl-cryptx' 'python' 'file' 'gifsicle' 'ghostscript' 'img2pdf'
        'imlib2' 'libjpeg-turbo' 'libpng' 'pngcrush' 'pngquant' 'poppler' 'bzip2' 'bzip3'
        'gzip' 'lzip' 'lzop' 'xz' 'p7zip' 'zstd'
    # AUR:
        'lzma_alone' 'python-rarfile'
)
optdepends=('wget: for download capability in the to-* recompression utilities')
conflicts=('file-rename-utils')
source=("https://sourceforge.net/projects/littleutils/files/littleutils-source/${pkgver}/littleutils-${pkgver}.tar.xz")
sha256sums=('ddf9dc4aed18dbacd8c950d7bf788f29dedeabb1431f06aa6532fd79274fe8ca')

build() {
    cd "littleutils-${pkgver}"
    ./configure --prefix='/usr'
    make
}

package() {
    make -C "littleutils-${pkgver}" DESTDIR="$pkgdir" install{,-extra}
    install -D -m644 "littleutils-${pkgver}/LICENSES" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
