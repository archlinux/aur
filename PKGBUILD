# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-slick-greeter'
_pkgname='slick-greeter'
pkgver='1.0.3'
pkgrel='1'
pkgdesc='A slick-looking LightDM greeter'
arch=(i686 x86_64)
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
source=("${url}/archive/${pkgver}.tar.gz")
depends=('gtk3' 'freetype2' 'gnome-common' 'lightdm' 'cairo' 'libcanberra' 'libxext' 'pixman')
makedepends=('intltool' 'vala')
sha256sums=('9a8a1ae4526ca179b6dd4613bdb52427a0c234f26ec4cd7ed60246081e8f10ba')

prepare() {
	cd ${_pkgname}-${pkgver}
}

build() {
    cd ${_pkgname}-${pkgver}

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
	cd ${_pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
}
