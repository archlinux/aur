# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-slick-greeter'
_pkgname='slick-greeter'
pkgver=1.0.9
pkgrel=1
pkgdesc="A slick-looking LightDM greeter"
arch=(i686 x86_64)
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
depends=('cairo' 'freetype2' 'gnome-common' 'gtk3' 'libcanberra' 'libxext' 'lightdm' 'pixman')
makedepends=('intltool' 'vala')
backup=('etc/lightdm/slick-greeter.conf')
sha256sums=('513e10c7cee836e33ea5fa3ad44c673d2f39c8b783f16556c0ed5dd8432a2818')

build() {
    cd ${_pkgname}-$pkgver

    aclocal --install

    autoreconf -vfi
    intltoolize -f

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/lightdm

    make
}

package() {
    cd ${_pkgname}-$pkgver
    make DESTDIR="$pkgdir" install
}
