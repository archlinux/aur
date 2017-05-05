# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-slick-greeter'
_pkgname='slick-greeter'
pkgver='1.0.1'
pkgrel='1'
pkgdesc='A slick-looking LightDM greeter'
arch=(i686 x86_64)
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
source=("${url}/archive/${pkgver}.tar.gz")
depends=('gtk3' 'cantarell-fonts' 'gnome-common' 'gnome-doc-utils' 'intltool' 'lightdm' 'libcanberra' 'libxext' 'pixman' 'xorg-server-xvfb')
makedepends=('librsvg' 'vala')
sha256sums=('3144afeeb7a5edb3d1a13b480fb0050dd3a57bb708a3a7f428731a7010efe0d0')

prepare() {
	cd ${_pkgname}-${pkgver}
}

build() {
    cd ${_pkgname}-${pkgver}

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

