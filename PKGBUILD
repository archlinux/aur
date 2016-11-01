# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme
_pkgname=arc-theme
pkgname=('arc-gtk-theme' 'arc-solid-gtk-theme')
pkgver=20161005
pkgrel=3
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
optdepends=('arc-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/horst3180/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('cbdb73424f85532d756f2b7ed781fbc49598be44e01715490c0f95a60d7e1ab1c4f58a02f1a60bc9aec7f9625a9b7190ed680888af9c6fdf8a192b935c2ebe33')

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
