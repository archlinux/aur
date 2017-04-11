# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >


pkgname='lightdm-slick-greeter'
_pkgname='slick-greeter'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='A slick-looking LightDM greeter'
arch=(i686 x86_64)
url="http://packages.linuxmint.com/pool/main/s/${_pkgname}"
license=('GPL3')
source=("${url}/${_pkgname}_${pkgver}.tar.xz")
depends=('cantarell-fonts' 'gnome-common' 'gnome-doc-utils' 'intltool' 'lightdm' 'libcanberra' 'libxext' 'pixman' 'xorg-server-xvfb')
makedepends=('gnome-common' 'gnome-doc-utils' 'imagemagick' 'intltool' 'librsvg' 'vala' 'xorg-server-xvfb')
optdepends=("ttf-ubuntu-font-family: Ubuntu's default font")
sha256sums=('4a8a107ed539af743f698f1104cd9769e9c2cd399dedeb31c025a5531a4a8fe3')

prepare() {
	cd "${_pkgname}"
}

build() {
    cd "${_pkgname}"

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
	cd "${_pkgname}"

    make DESTDIR="${pkgdir}" install
}

