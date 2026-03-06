# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=littleutils
pkgver=1.4.0
pkgrel=1
pkgdesc='Utilities for compression, file manipulation, text cleanup, and images/PDF optimization'
arch=('x86_64')
url='https://sourceforge.net/projects/littleutils/'
license=('LicenseRef-Custom')
depends=(
    '7zip'
    'bash'
    'bzip2'
    'bzip3'
    'file'
    'gifsicle'
    'ghostscript'
    'glibc'
    'gzip'
    'img2pdf'
    'imlib2'
    'libjpeg-turbo'
    'libpng'
    'lzip'
    'lzma_alone'
    'lzop'
    'optipng'
    'perl'
    'perl-cryptx'
    'pngcrush'
    'pngquant'
    'poppler'
    'python'
    'python-rarfile'
    'xz'
    'zstd')
optdepends=(
    'wget: for download capability in the to-* recompression utilities')
conflicts=('file-rename-utils')
source=("https://sourceforge.net/projects/littleutils/files/littleutils-source/${pkgver}/littleutils-${pkgver}.tar.lz")
sha256sums=('fc75d439dab45733a0aaa60c2df640f1b9f5effd0671cc9dd32b23f922450eed')

build() {
    cd "littleutils-${pkgver}"
    ./configure --prefix='/usr'
    make
}

package() {
    make -C "littleutils-${pkgver}" DESTDIR="$pkgdir" install{,-extra}
    install -D -m644 "littleutils-${pkgver}/LICENSES" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
