# Maintainer: Michał Przybyś <michal@przybys.eu>
pkgname=spek-wxgtk3
pkgver=0.8.3
pkgrel=1
pkgdesc='An acoustic spectrum analyser (compiled against wxGtk3 and latest ffmpeg)'
arch=(x86_64)
url='http://spek.cc/'
license=(GPL3)
depends=(desktop-file-utils
        ffmpeg
        wxgtk3)
makedepends=(intltool)
conflicts=(spek)
provides=(spek)
source=("https://github.com/alexkay/spek/archive/v${pkgver}.tar.gz"
        ffmpeg.patch)
md5sums=(f0d79a50f76e8f793d994425986a1993
         6068a51d9e8727c908e3de1af26adaba)

prepare() {
    cd "spek-${pkgver}"
    patch -Np1 -i "$srcdir/ffmpeg.patch"
}

build() {
	cd "spek-${pkgver}"
	./autogen.sh --with-wx-config=/usr/bin/wx-config-gtk3 --prefix=/usr
	make
}

package() {
	cd "spek-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
