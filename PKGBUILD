# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme
_pkgname=arc-theme
pkgname=('arc-gtk-theme' 'arc-solid-gtk-theme')
pkgver=20170302
pkgrel=1
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
optdepends=('arc-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/horst3180/${_pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/horst3180/${_pkgname}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz.asc")
validpgpkeys=('A46FD8E741A2A075898462CDC57DFF0D28DAAE97')
sha512sums=('99408a7c4db2bd2d81453e308ae5d9bc9bfda4f11e57191936f985de2937debff76c4d1f37a97ac8f5ad3751401ee8ad02457e4558b9c4aedc2bfeba1736ef03'
            'SKIP')

build() {
        cd "${_pkgname}-$pkgver"
        ./autogen.sh --prefix=/usr
}

package_arc-gtk-theme() {
        pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
        replaces=('gtk-theme-arc')

        cd "${_pkgname}-$pkgver"
        ./configure --prefix=/usr
        make DESTDIR="${pkgdir}" install
}

package_arc-solid-gtk-theme() {
        pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell (without transparency)"
        conflicts=('arc-gtk-theme' 'gtk-theme-arc')
        provides=('arc-gtk-theme')
        replaces=('gtk-theme-arc-solid')

        cd "${_pkgname}-$pkgver"
        ./configure --prefix=/usr --disable-transparency
        make DESTDIR="${pkgdir}" install
}
