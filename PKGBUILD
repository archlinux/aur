# Maintainer: Michał Przybyś <michal@przybys.eu>
pkgname=spek-wxgtk3
pkgver=0.8.3
pkgrel=2
pkgdesc='An acoustic spectrum analyser (compiled against wxGtk3 and ffmpeg4.4)'
arch=(x86_64)
url='http://spek.cc/'
license=(GPL3)
depends=(desktop-file-utils
        ffmpeg4.4
        wxgtk3)
makedepends=(intltool)
conflicts=(spek)
provides=(spek)
source=("https://github.com/alexkay/spek/archive/v${pkgver}.tar.gz"
        ffmpeg.patch)
sha256sums=(f5c09d0062aaafe882e2e617f6d5db2ab540e2a657c1bee38260f7f0567bf175
            79b1bdc7536e39ca6c9c52fddb998b987949f3cc1893b452fd93b4dd371c29ad)

prepare() {
    cd "spek-${pkgver}"
    patch -Np1 -i "$srcdir/ffmpeg.patch"
}

build() {
    cd "spek-${pkgver}"
    export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
    ./autogen.sh --with-wx-config=/usr/bin/wx-config-gtk3 --prefix=/usr
    make
}

package() {
    cd "spek-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
