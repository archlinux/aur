# Maintainer: Mitch Bigelow <mitch.bigelow at gmail.com>
# Contributer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=geeqie-git
pkgver=20200406
pkgrel=1
pkgdesc='Lightweight image viewer'
arch=('x86_64')
url="http://www.geeqie.org/"
license=('GPL2')
depends=('gtk3' 'exiv2' 'ffmpegthumbnailer')
makedepends=('git' 'intltool' 'python')
optdepends=('librsvg: SVG rendering'
            'fbida: for jpeg rotation')
provides=('geeqie')
conflicts=('geeqie')
source=("git+git://www.geeqie.org/geeqie.git")
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
