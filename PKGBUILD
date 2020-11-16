# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="lightpad"
pkgver="0.0.8"
pkgrel="2"
pkgdesc="A lightweight, simple and powerful application launcher. Writen in GTK+ 3.0. It is also Wayland compatible."
arch=('x86_64')
url="https://github.com/libredeb/${pkgname}"
license=('GPL3')
depends=('cairo>=1.15.0' 'gdk-pixbuf2>=2.36.0' 'glib2>=2.50.0' 'glibc>=2.28.0' 'gtk3>=3.22.0' 'gnome-menus>=3.13.0' 'libgee>=0.18.0')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala>=0.28.0')

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('59b4328c5c140c948f83007d003ad47486d1ba8c90842462a904574cf0e5dfe5')

prepare() {
    rm -rf build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    arch-meson . build --prefix /usr
    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
