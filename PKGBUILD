# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-slick-greeter'
_pkgname='slick-greeter'
pkgver=1.1.4
pkgrel=1
pkgdesc="A slick-looking LightDM greeter"
arch=(i686 x86_64)
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
depends=('cairo' 'freetype2' 'gnome-common' 'gtk3' 'libcanberra' 'libxext' 'lightdm' 'pixman')
makedepends=('intltool' 'vala')
optdepends=("numlockx: enable numerical keypad on supported keyboards")
sha256sums=('a73e5f8a448731b6497fbf6a6599a38892ea316f6c075e3b63a14911ffdf565d')

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
