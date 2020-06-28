# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname='fondo'
pkgver=1.3.9
pkgrel=1
pkgdesc='Wallpaper App for Linux'
arch=('x86_64')
changelog='CHANGELOG'
url="https://github.com/calo001/${pkgname}"
license=('GPL3')
depends=('granite' 'libsoup' 'json-glib' 'gtk-theme-elementary' 'elementary-icon-theme')
makedepends=('git' 'meson' 'vala')
conflicts=("${pkgname}-git")
source=("git+${url}.git#tag=${pkgver}"
        "elementary-theme.patch")
sha256sums=('SKIP'
            '572d2b1e8bc3acac50dd43e8dee5982560d1c794561744ced69c9670c5243907')

pkgver () {
    cd ${pkgname}
    git describe --tags | sed 's/-/.r/; s/-/./'
}

prepare () {
    cd ${pkgname}
    patch -p1 < "${srcdir}/elementary-theme.patch"
}

build () {
    arch-meson ${pkgname} build
    ninja -C build
}

package () {
    DESTDIR="${pkgdir}" ninja -C build install
}
