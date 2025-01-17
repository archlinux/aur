# Maintainer: Maciej Dems <macdems at gmail.com>

pkgname=geeqie15
pkgver=1.5
pkgrel=3
pkgdesc='Lightweight image viewer (version 1.5)'
arch=('x86_64')
url="http://www.geeqie.org/"
license=('GPL2')
depends=('exiv2' 'gtk2' 'ffmpegthumbnailer'
         'djvulibre' 'libheif' 'libchamplain'
         'poppler-glib')
makedepends=('git'
             'intltool' 'python' 'librsvg'
             'libwmf' 'libwebp' 'imagemagick'
             'fbida' 'gawk' 'perl-image-exiftool'
             'glib2-devel')
optdepends=('librsvg: SVG rendering'
            'fbida: for jpeg rotation'
            'gawk: to use the geo-decode function'
            'perl-image-exiftool: for the jpeg extraction plugin'
            'gphoto2: command-line tools for various (plugin) operations'
            'imagemagick: command-line tools for various (plugin) operations')
provides=('geeqie')
conflicts=('geeqie' 'geeqie-gtk2')
source=("https://github.com/BestImageViewer/geeqie/releases/download/v1.5/geeqie-1.5.tar.xz"
        "geeqie-exiv2_0.28.patch")
sha256sums=('9736c8cbf21cc39d0a9c720934cdd33fe2756dc903c2a12cfc78b8822d2d1bf5'
            '0e302cb384de07e9725f34046a39db5fef6a4ccd0b5b1e5ab33c7bccdd3679a1')

prepare() {
    cd "${srcdir}/geeqie-${pkgver}"
    patch -Np1 -i ../geeqie-exiv2_0.28.patch
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/geeqie-${pkgver}"

    CFLAGS="-fcommon -Wno-unused-result"
    
    ./configure \
        --prefix=/usr \
        --disable-lirc \
        --disable-lua
    make
}

package() {
    cd "${srcdir}/geeqie-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
