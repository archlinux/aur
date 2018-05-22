# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-slick-greeter'
_pkgname='slick-greeter'
pkgver=1.2.1
pkgrel=1
pkgdesc="A slick-looking LightDM greeter"
arch=(i686 x86_64)
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
depends=('cairo' 'freetype2' 'gtk3' 'libcanberra' 'libxext' 'lightdm' 'pixman')
makedepends=('intltool' 'vala' 'gnome-common')
optdepends=("numlockx: enable numerical keypad on supported keyboards")
sha256sums=('10b79f613ff621aa8b0a1331f27f2572b5c6fdc2e814fd6dadcf7d12d52e9bed')

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
