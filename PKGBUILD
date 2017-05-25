# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname='lightdm-slick-greeter'
_pkgname='slick-greeter'
pkgver='1.0.5'
pkgrel='1'
pkgdesc='A slick-looking LightDM greeter'
arch=(i686 x86_64)
url="https://github.com/linuxmint/${_pkgname}"
license=('GPL3')
source=("${url}/archive/${pkgver}.tar.gz")
depends=('gtk3' 'freetype2' 'gnome-common' 'lightdm' 'cairo' 'libcanberra' 'libxext' 'pixman')
makedepends=('intltool' 'vala')
sha256sums=('d291a58c5493eefac08103e743d80359d7920bf446da7ac038e5f442ca7446f1')

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
