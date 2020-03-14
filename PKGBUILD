# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=geeqie-git
pkgver=20200203
pkgrel=1
pkgdesc='Lightweight image viewer'
arch=('x86_64')
url="http://www.geeqie.org/"
license=('GPL2')
depends=('gtk3' 'exiv2' 'ffmpegthumbnailer')
makedepends=('git' 'intltool' 'python')
#makedepends=('git' 'intltool' 'doxygen' 'yelp-tools' 'python')
optdepends=('librsvg: SVG rendering'
            'fbida: for jpeg rotation')
provides=('geeqie')
conflicts=('geeqie')
source=("git+https://github.com/BestImageViewer/geeqie.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/geeqie"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
    cd "${srcdir}/geeqie"
}

build() {
    cd "${srcdir}/geeqie"

    ./autogen.sh \
        --prefix=/usr \
        --disable-lua \
        --disable-pdf
    make
}

package() {
    cd "${srcdir}/geeqie"
    make DESTDIR="${pkgdir}" install
}
