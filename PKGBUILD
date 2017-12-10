# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-slick-greeter'
_pkgname='slick-greeter'
pkgver=1.1.3
pkgrel=1
pkgdesc="A slick-looking LightDM greeter"
arch=(i686 x86_64)
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
depends=('cairo' 'freetype2' 'gnome-common' 'gtk3' 'libcanberra' 'libxext' 'lightdm' 'pixman')
makedepends=('intltool' 'vala')
optdepends=("numlockx: enable numerical keypad on supported keyboards")
sha256sums=('39f88e624d15e46047e3dac8d02392714a25a02deef6ff6feb014b5c54e81877')

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
