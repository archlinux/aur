# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: zach <zach {at} zach-adams {dot} com>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

pkgbase=arc-gtk-theme
_pkgname=arc-theme
pkgname=('arc-gtk-theme' 'arc-solid-gtk-theme')
pkgver=20170302
pkgrel=4
arch=('any')
url="https://github.com/horst3180/${_pkgname}"
license=('GPL3')
optdepends=('arc-icon-theme: recommended icon theme'
            'gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes')
makedepends=('gtk3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz.asc"
        'change-solid-theme-path.patch')
sha512sums=('99408a7c4db2bd2d81453e308ae5d9bc9bfda4f11e57191936f985de2937debff76c4d1f37a97ac8f5ad3751401ee8ad02457e4558b9c4aedc2bfeba1736ef03'
            'SKIP'
            '5b1ca739206e386cb4bf1f2f0a9524a08f2590972126cc96ef7c2e56ca59e94136cf7f8dc8184cd1c688a488e5e96384d654e279778f93e8f34860f7281afff9')
validpgpkeys=('A46FD8E741A2A075898462CDC57DFF0D28DAAE97')

prepare() {
    cp -a ${_pkgname}-${pkgver}{,-solid}
    cd ${_pkgname}-${pkgver}-solid
    patch -p1 -i ../change-solid-theme-path.patch
}

build() {
    cd ${_pkgname}-${pkgver}
    ./autogen.sh --prefix=/usr

    cd ../${_pkgname}-${pkgver}-solid
    ./autogen.sh --prefix=/usr --disable-transparency
}

package_arc-gtk-theme() {
    pkgdesc="A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell"
    replaces=('gtk-theme-arc')

    cd ${_pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

package_arc-solid-gtk-theme() {
    pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell (without transparency)"
    replaces=('gtk-theme-arc-solid')

    cd ${_pkgname}-${pkgver}-solid
    make DESTDIR="${pkgdir}" install
}
