# Maintainer: Mitch Bigelow <mitch.bigelow at gmail.com>
# Contributer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=geeqie-git
pkgver=20220721
pkgrel=1
pkgdesc='Lightweight image viewer'
arch=('x86_64')
url="http://www.geeqie.org/"
license=('GPL2')
depends=('exiv2' 'gtk3' 'ffmpegthumbnailer' 'gspell'
         'djvulibre' 'libchamplain' 'poppler-glib'
         'poppler-glib' 'libarchive' 'libheif' 'libraw' 'libjxl' 'librsvg' 'libwebp')
makedepends=('git' 'meson'
             'highway' # for libjxl
             # for the docs
             'pandoc' 'yelp-tools' 'graphviz' 'xxd')
optdepends=('librsvg: SVG rendering'
            'fbida: for jpeg rotation'
            'gawk: to use the geo-decode function'
            'perl-image-exiftool: for the jpeg extraction plugin'
            'gphoto2: command-line tools for various (plugin) operations'
            'imagemagick: command-line tools for various (plugin) operations')
provides=('geeqie')
conflicts=('geeqie')
source=("git+git://git.geeqie.org/geeqie.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/geeqie"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
    cd "${srcdir}/geeqie"

    arch-meson \
        -Dlua=disabled \
        build
    meson compile -C build
}

package() {
    cd "${srcdir}/geeqie"
    
    meson install -C build --destdir "${pkgdir}"
}
