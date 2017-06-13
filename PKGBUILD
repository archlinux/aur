# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-slick-greeter'
_pkgname='slick-greeter'
pkgver=1.0.7
pkgrel=1
pkgdesc="A slick-looking LightDM greeter"
arch=(i686 x86_64)
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
depends=('cairo' 'freetype2' 'gnome-common' 'gtk3' 'libcanberra' 'libxext' 'lightdm' 'pixman')
makedepends=('intltool' 'vala')
backup=('etc/lightdm/slick-greeter.conf')
sha256sums=('c0f0df072d5823eb61f64f7a60afc7459910317e5e088e8debe83b61efd3c731')

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
