# Maintainer: Tomoghno Sen <tomoghno@outlook.com>

pkgname='fondo'
pkgver=1.6.1
pkgrel=2
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
            'e2204425522f276d7604f7a3b6471d85cc8d11ede2b2d6b12d66a254f581ec9b')

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
