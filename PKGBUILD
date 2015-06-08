# Maintainer: Ainola

pkgname=gnome-mpv
pkgver=0.4
pkgrel=2
pkgdesc="GNOME frontend for MPV"
arch=('i686' 'x86_64')
url="https://github.com/gnome-mpv/gnome-mpv"
license=('GPL3')
depends=('gtk3' 'mpv')
makedepends=('intltool')
conflicts=('gnome-mpv-git')
source=("https://github.com/gnome-mpv/gnome-mpv/archive/v${pkgver}.tar.gz"
        "${pkgname}.install"
        "remove-inline.patch")
sha256sums=('3b72cc9c070d6e5efd4390b1ab333b50e7f4da380452169a40754be4128d4ffc'
            '2f53c431d6a6ed51b5abe0f42f90bdcd9c1cc7776962e8f8bc0d77a95e114f51'
            '59f5475a40b3eaa68bb6ea6955b219ee148f8301337caf3fbfe6e7dd3958b0ff')
install=('gnome-mpv.install')

prepare() {
    # Fix issue #27 (https://github.com/gnome-mpv/gnome-mpv/issues/27) until next release.
    patch -p0 < remove-inline.patch
}

build() {
    cd "${pkgname}-${pkgver}"
    autoreconf -sfi
    intltoolize -c --automake
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
